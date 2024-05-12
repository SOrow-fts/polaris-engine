<?php
$error_msg = '';
$succeed_msg = '';

function init()
{
    if (!isset($_POST)) {
        return;
    }

    $id = "" . time();

    $account = htmlspecialchars($_POST['title']);
    if ($account == '') {
        $GLOBALS['error_msg'] = 'アカウントを入力してください。';
        return;
    }

    $title = htmlspecialchars($_POST['title']);
    if ($title == '') {
        $GLOBALS['error_msg'] = 'タイトルを入力してください。';
        return;
    }

    $explanation = htmlspecialchars($_POST['explanation']);
    if ($explanation == '') {
        $GLOBALS['error_msg'] = '説明を入力してください。';
        return;
    }

    if (!isset($_FILES)) {
        return;
    }
    if ($_FILES['preview']['tmp_name'] == '') {
        $GLOBALS['error_msg'] = 'プレビューのアップロードに失敗しました。';
        return;
    }
    if ($_FILES['data01arc']['tmp_name'] == '') {
        $GLOBALS['error_msg'] = 'パッケージのアップロードに失敗しました。';
        return;
    }

    try {
        mkdir('run/' . $id);
        copy($_FILES['preview']['tmp_name'], 'run/' . $id . '/preview.jpg');
        copy($_FILES['data01arc']['tmp_name'], 'run/' . $id . '/data01.arc');
        copy('base/index.html', 'run/' . $id . '/index.html');
                copy('base/index.js', 'run/' . $id . '/index.js');
        copy('base/index.wasm', 'run/' . $id . '/index.wasm');
                exec("sed -e 's|<title>A Polaris Engine Exported Game</title>|" .
             '<title>A Polaris Engine Exported Game</title>' .
             '<meta name="twitter:card" content="player">' .
             '<meta name="twitter:site" content="' . $account . '">' .
             '<meta name="twitter:title" content="' . $title . '">' .
             '<meta name="twitter:description" content="' .$explanation . '">' .
             '<meta name="twitter:image" content="' . 'https://polaris-novel.app/run/'. $id . '/preview.jpg">' .
             '<meta name="twitter:player" content="https://polaris-novel.app/run/' . $id . '/">' .
             '<meta name="twitter:player:width" content="1280">' .
             '<meta name="twitter:player:height" content="720">' . "|g' " .
                         ' -i run/' . $id . '/index.html');
    } catch (Exception $e) {
        echo($e->getMessage());
        return;
    }

    $GLOBALS['succeed_msg'] = 'アップロードに成功しました。<br>URLをポストに貼り付けてください: https://polaris-novel.app/run/' . $id . '/';
}

function on_error()
{
    echo($GLOBALS['error_msg']);
}

function on_succeed()
{
    echo($GLOBALS['succeed_msg']);
}

init();
?>
<!DOCTYPE html>
<html lang="ja-JP">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>Polaris EngineのゲームをXのタイムラインに埋め込もう！</title>
</head>
<body>
<h1 class="space">Polaris Engine SNSタイムライン 連携</h1>
<p>
  Xのタイムラインにゲームを埋め込むためのURLを生成します。<br>
  XのAPI連携は行いませんので安心してご利用ください。<br>
  ゲームは3日後に消えます。<br>
</p>

<h2>アップロード</h2>

<p style="color:red;"><?php on_error(); ?></p>
<p style="color:blue;"><?php on_succeed(); ?></p>

<form method="POST" action="https://polaris-novel.app/" enctype="multipart/form-data">
  <label>Xアカウント名 (@を含む):</label><br>
  <input type="text" id="account" name="account"><br>
  <br>
  <label>ゲームタイトル:</label><br>
  <input type="text" id="title" name="title"><br>
  <br>
  <label>説明文:</label><br>
  <input type="text" id="explanation" name="explanation"><br>
  <br>
  <label>プレビュー画像(JPEG):</label><br>
  <input type="file" id="preview" name="preview" accept="image/jpeg"><br>
  <br>
  <label>data01.arc (30MB以内):</label><br>
  <input type="file" id="data01arc" name="data01arc" accept=".arc"><br>
  <br>
  <br>
  <input type="submit" value="アップロードを実行する" name="submit">
</form>

<br>
<br>
<p>
  Xのタイムラインへの投稿以外に利用しないでください。<br>
  表現が不適切なコンテンツをみつけた際は、緊急性があれば core@polaris-engine.com へご連絡ください。<br>
  (緊急性がなければ3日で消えますのでご安心ください。)
</p>

</body>
</html>
