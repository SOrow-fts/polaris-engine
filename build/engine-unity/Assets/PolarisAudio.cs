/* -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: t; -*- */

/*
 * Polaris Engine
 * Copyright (C) 2001-2024, Keiichi Tabata. All rights reserved.
 */

/*
 * The Polaris Engine Audio HAL for Unity.
 */

using UnityEngine;

[RequireComponent(typeof(AudioSource))]
public class PolarisAudioStream : MonoBehaviour
{
	unsafe byte *wave;

	unsafe public void SetSource(byte *w)
	{
		wave = w;
	}

	void Start()
	{
	}

	unsafe void OnAudioFilterRead(float[] data, int channels)
	{
		if (wave == null)
			return;

		// Assume (channels==2)
		int samples = data.Length / channels;

		// Get PCM samples.
		short[] intData = new short[samples * 2];
		fixed(short *unsafePointer = intData)
		{
			PolarisEngine.get_wave_samples(wave, (uint *)unsafePointer, samples);
			for (int i = 0; i < samples * 2; i++)
				data[i] = intData[i] / 32767.0f;
		}

		// Stop if we reached to an end-of-stream.
		if (PolarisEngine.is_wave_eos(wave))
			wave = null;
	}
}
