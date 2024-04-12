#!/bin/bash

SED='sed'
if [ ! -z "`which gsed`" ]; then
	SED='gsed';
fi

function upload()
{
    ftp-upload.sh $1;
}

upload index.html
upload dl/index.html
upload dl/material/index.html
upload wiki/skin/pukiwiki.skin.php
upload award2023.html
upload award2024.html

upload en/index.html
upload en/dl/index.html
upload en/wiki/skin/pukiwiki.skin.php
