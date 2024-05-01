/* -*- coding: utf-8; tab-width: 4; indent-tabs-mode: nil; -*- */

/*
 * Polaris Engine
 * Copyright (C) 2001-2024, Keiichi Tabata. All rights reserved.
 */

package com.polarisengine.proandroid;

import android.annotation.SuppressLint;
import android.content.res.AssetFileDescriptor;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.SpannableStringBuilder;
import android.text.style.BackgroundColorSpan;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

import androidx.activity.ComponentActivity;
import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.annotation.NonNull;

import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.File;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/**
 * The main activity.
 */
public class MainActivity extends ComponentActivity {
	// The app name for logging.
	public static final String APP_NAME = "Polaris Engine";

	// JNI
    static {
		// Load libpolaris.so and native*() methods will be available.
		System.loadLibrary("polaris");
	}
	public native void nativeInitGame(String basePath);
	public native void nativeReinitOpenGL();
	public native void nativeRunFrame();
    public native boolean nativeOnPause();
    public native boolean nativeOnResume();
	public native void nativeOnTouchStart(int x, int y, int points);
	public native void nativeOnTouchMove(int x, int y);
	public native void nativeOnTouchEnd(int x, int y, int points);
	public native int nativeGetIntConfigForKey(String key);
	public native void nativeSetContinueFlag();
	public native void nativeSetNextFlag();
	public native void nativeSetStopFlag();
	public native void nativeSetOpenFlag(String file);
	public native void nativeSetLineFlag(int line);
	public native void nativeSaveScript();
	public native String nativeGetScript();
	public native boolean nativeUpdateScriptModel(String script);

    // Singleton.
    public static MainActivity instance;

	// The project path.
	public String basePath;

    // The video view that is not generated by layout XML.
    private VideoSurfaceView videoView;

	//
	// Screen Information
	//

    // The scale factor of the game view.
    public float scale;

    // The view port X offset.
	public int offsetX;

    // The view port Y offset.
	public int offsetY;

    // Touch coordiantes.
	public int touchLastY;

    // A count of touched fingers.
	public int touchCount;

	//
	// Running Status
	//

	// A flag to show if the game project is loaded.
	public boolean isProjectOpened;

    // A flag to show if we are restarting game view after a video playback.
    public boolean resumeFromVideo;

	//
	// MediaPlayer
	//
	public MediaPlayer video;

    // An object to synchronize between the main thread and rendering or video threads. 
    public final Object syncObj = new Object();

	//
	// MainActivity
	//

	@Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        instance = this;

        // Load layout.
		if(getPackageManager().hasSystemFeature("org.chromium.arc.device_management"))
			setContentView(R.layout.desktop);
		else
			setContentView(R.layout.main);

		// Add listeners.
		findViewById(R.id.buttonContinue).setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				synchronized (syncObj) {
					nativeSetContinueFlag();
				}
			}
		});
		findViewById(R.id.buttonNext).setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				synchronized (syncObj) {
					nativeSetNextFlag();
				}
			}
		});
		findViewById(R.id.buttonStop).setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				synchronized (syncObj) {
					nativeSetStopFlag();
				}
			}
		});
		findViewById(R.id.textViewScriptFile).setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				// TODO:
				//  - Show a file chooser
				//  - Call nativeSetOpenFlag(file) in an async way.
			}
		});
		findViewById(R.id.buttonMove).setOnClickListener(new View.OnClickListener() {
			@Override public void onClick(View v) {
				// Get the string and the cursor line number from the EditText.
				EditText editScript = findViewById(R.id.editScript);
				String script = editScript.getText().toString();
				int line = editScript.getLayout().getLineForOffset(editScript.getSelectionStart());

				// Call the native code.
				String fixedScript = null;
				synchronized (syncObj) {
					// Reconstruct the script model.
					if (!nativeUpdateScriptModel(script))
						fixedScript = nativeGetScript();

					// Move the next execution line to the cursor line.
					nativeSetLineFlag(line);

					// Reserve a single step execution.
					nativeSetNextFlag();

					// Save the script.
					nativeSaveScript();
				}

				// If there are syntax errors,
				if (fixedScript != null) {
					editScript.setText(fixedScript);
					// TODO: do the coloring.
				}
			}
		});

        // Prepare the video view.
        videoView = new VideoSurfaceView(this);
        Thread videoThread = new Thread(videoView);
        videoThread.start();

		// Start.
		openProject();
    }

    @Override
    public void onPause() {
        super.onPause();
        nativeOnPause();
    }

    @Override
    public void onResume() {
        super.onResume();
        nativeOnResume();
    }

	@Override
	public void onDestroy() {
		super.onDestroy();
		isProjectOpened = false;
	}

	//
	// Project
	//

	private void openProject() {
		// This will call onActivityResult() if a user give us a permission to a folder.
		dirRequest.launch(null);
	}

	final ActivityResultLauncher<Uri> dirRequest = registerForActivityResult(
			new ActivityResultContracts.OpenDocumentTree(),
			new ActivityResultCallback<Uri>() {
				@Override
				public void onActivityResult(Uri uri) {
					if (uri != null) {
						// Get the real path.
						basePath = FileUtil.getFullPathFromTreeUri(uri, MainActivity.instance);

						// Append the "PolarisEngine" directory path/
						if (!basePath.endsWith("/PolarisEngine"))
							basePath = basePath + "/PolarisEngine/";
						else
							basePath = basePath + "/";

						// Copy the template game.
						File fileBasePath = new File(basePath);
						if (!fileBasePath.exists())
							fileBasePath.mkdirs();
						if (!new File(basePath + "conf/config.txt").exists() ||
							!new File(basePath + "txt/init.txt").exists())
							extractTemplateGame(basePath);

						// Initialize the Polaris Engine in the rendering thread.
						synchronized (MainActivity.instance.syncObj) {
							MainActivity.instance.isProjectOpened = true;
						}
					} else {
						// Exit.
						finishAndRemoveTask();
					}
				}
			});

	private void extractTemplateGame(String basePath) {
		try {
			InputStream is = getResources().getAssets().open("game.zip");
			ZipInputStream zis = new ZipInputStream(new BufferedInputStream(is));
			ZipEntry ze;
			byte[] buffer = new byte[1024];
			int count;
			while((ze = zis.getNextEntry()) != null) {
				File f = new File(basePath, ze.getName());
				String canonicalPath = f.getCanonicalPath();
				if (!canonicalPath.startsWith(basePath)) {
					throw new SecurityException("Zip Path Traversal Vulnerability");
				}

				if (ze.isDirectory()) {
					File fmd = new File(canonicalPath);
					fmd.mkdirs();
					continue;
				}

				FileOutputStream fout = new FileOutputStream(canonicalPath);
				while ((count = zis.read(buffer)) != -1) {
					fout.write(buffer, 0, count);
				}
				fout.close();
				zis.closeEntry();
			}
			zis.close();
		} catch(IOException e) {
			Log.e(APP_NAME, "Failed to read file.");
			finishAndRemoveTask();
		}
	}

	//
	// Script view
	//

	private void doColoring(int execLine) {
		EditText editScript = findViewById(R.id.editScript);
		Spannable spannableScript = editScript.getText();
		String plainScript = spannableScript.toString();

		//noinspection ReassignedVariable
		int curLine = 0;
		//noinspection ReassignedVariable
		int startAt = 0;
		for(String line : plainScript.split("\n")) {
			if(curLine != execLine)
				spannableScript.setSpan(new BackgroundColorSpan(0xffffffff), startAt, startAt + line.length(), Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
			else
				spannableScript.setSpan(new BackgroundColorSpan(0xffc0c0ff), startAt, startAt + line.length(), Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
			curLine++;
			startAt += line.length() + 1; // +1 for a line-feed
		}
	}

	private void doScroll(int line) {
		EditText editScript = findViewById(R.id.editScript);
		editScript.post(() -> {
			int y = editScript.getLayout().getLineTop(line);
			editScript.scrollTo(0, y);
		});
	}

	//
	// Bridges
	//  - We name methods that are called from JNI codes "bridge*()"
	//  - It's because they delegate HAL's "on_*()" C functions to Java methods i.e. bridging.
	//

	public void bridgeAlert(String text) {
		// FIXME: implement a dialog.
		Log.e(APP_NAME, text);
	}

	public void bridgeChangeRunningState(boolean running, boolean stopRequested) {
		// TODO: enable and disable views.
	}

	public void bridgeLoadScript(String scriptName, String scriptContent) {
		new Handler(Looper.getMainLooper()).post(()->{
			// Set script name.
			TextView textViewScriptFile = findViewById(R.id.textViewScriptFile);
			textViewScriptFile.setText(scriptName);

			// Set script text.
			EditText editScript = findViewById(R.id.editScript);
			editScript.setText(scriptContent);
		});
	}

	public void bridgeChangePosition(int line) {
		new Handler(Looper.getMainLooper()).post(()-> {
			doColoring(line);
			doScroll(line);
		});
	}

	public void bridgeUpdateVariables() {
		// TODO: add variable view.
	}

	private void bridgePlayVideo(String fileName, boolean isSkippable) {
		if (video != null) {
			video.stop();
			video = null;
		}
		try {
			AssetFileDescriptor afd;
			afd = getAssets().openFd("mov/" + fileName);
			video = new MediaPlayer();
			video.setDataSource(afd.getFileDescriptor(), afd.getStartOffset(), afd.getLength());
			video.prepare();
			new Handler(Looper.getMainLooper()).post(() -> {
				//findViewById(R.id.gameView).setRenderMode(RENDERMODE_WHEN_DIRTY);
				//setContentView(videoView);
				//video.start();
				//super.handleMessage(msg);
			});
		} catch(IOException e) {
			Log.e(APP_NAME, "Failed to play video " + fileName);
		}
	}

	private void bridgeStopVideo() {
		if(video != null) {
			video.stop();
			video.reset();
			video.release();
			video = null;
			new Handler(Looper.getMainLooper()).post(() -> {
				//resumeFromVideo = true;
				//setContentView(findViewById(R.id.gameView));
				//findViewById(R.id.gameView).setRenderMode(RENDERMODE_CONTINUOUSLY);
				//super.handleMessage(msg);
			});
		}
	}

	private boolean bridgeIsVideoPlaying() {
		if(video != null) {
			int pos = video.getCurrentPosition();
			if (pos == 0)
				return true;
			if (video.isPlaying())
				return true;
			video.stop();
			new Handler(Looper.getMainLooper()).post(() -> {
				//resumeFromVideo = true;
				//setContentView(findViewById(R.id.gameView));
				//findViewById(R.id.gameView).setRenderMode(RENDERMODE_CONTINUOUSLY);
				//super.handleMessage(msg);
			});
		}
		return false;
	}
}
