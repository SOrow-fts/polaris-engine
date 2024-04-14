#!/bin/sh

set -eu

echo "Going to install Polaris Engine..."

UNAME=`uname -a`
if [ ! -z "`echo $UNAME | grep Ubuntu`" ]; then
    sudo apt update;
    sudo apt install build-essential wget unzip zlib1g-dev libpng-dev libjpeg9-dev libbz2-dev libwebp-dev libogg-dev libvorbis-dev libfreetype-dev libasound2-dev libx11-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libxpm-dev mesa-common-dev cmake qt6-base-dev qt6-multimedia-dev libqt6core6 libqt6gui6 libqt6widgets6 libqt6opengl6-dev libqt6openglwidgets6 libqt6multimedia6 libqt6multimediawidgets6 libbrotli-dev
    rm -f master.zip master.zip.*;
    wget https://github.com/ktabata/polaris-engine/archive/refs/heads/master.zip;
    rm -rf polaris-engine-master;
    unzip master.zip;
    rm master.zip;
    cd polaris-engine-master;
    make;
    sudo make install;
    cd ..;
    rm -rf  polaris-engine-master;
    echo "";
    echo "Please run 'polaris-engine'";
    exit 0;
fi
if [ ! -z "`echo $UNAME | grep Debian`" ]; then
    sudo apt update;
    sudo apt install build-essential wget unzip zlib1g-dev libpng-dev libjpeg-dev libbz2-dev libwebp-dev libogg-dev libvorbis-dev libfreetype-dev libasound2-dev libx11-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libxpm-dev mesa-common-dev cmake qt6-base-dev qt6-multimedia-dev libqt6core6 libqt6gui6 libqt6widgets6 libqt6opengl6-dev libqt6openglwidgets6 libqt6multimedia6 libqt6multimediawidgets6 libbrotli-dev
    rm -f master.zip master.zip.*;
    wget https://github.com/ktabata/polaris-engine/archive/refs/heads/master.zip;
    rm -rf polaris-engine-master;
    unzip master.zip;
    rm master.zip;
    cd polaris-engine-master;
    make;
    sudo make install;
    cd ..;
    rm -rf  polaris-engine-master;
    echo "";
    echo "Please run 'polaris-engine'";
fi
if [ ! -z "`echo $UNAME | grep FreeBSD`" ]; then
    sudo pkg update;
    sudo pkg install gmake gsed unzip alsa-lib alsa-plugins qt6 xorg cmake mesa-devel freetype2;
    rm -f master.zip master.zip.*;
    curl -O https://github.com/ktabata/polaris-engine/archive/refs/heads/master.zip;
    rm -rf polaris-engine-master;
    unzip master.zip;
    rm master.zip;
    cd polaris-engine-master;
    make;
    sudo make install;
    cd ..;
    rm -rf  polaris-engine-master;
    echo "";
    echo "Please run 'polaris-engine'";
fi
if [ ! -z "`echo $UNAME | grep NetBSD`" ]; then
    sudo pkg update;
    sudo pkg install gmake gsed unzip alsa-lib alsa-plugins qt6 xorg cmake mesa-devel freetype2;
    rm -f master.zip master.zip.*;
    curl -O https://github.com/ktabata/polaris-engine/archive/refs/heads/master.zip;
    rm -rf polaris-engine-master;
    unzip master.zip;
    rm master.zip;
    cd polaris-engine-master;
    make;
    sudo make install;
    cd ..;
    rm -rf  polaris-engine-master;
    echo "";
    echo "Please run 'polaris-engine'";
fi
