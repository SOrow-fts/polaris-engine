#!/bin/sh

set -eu

echo "Going to install Polaris Engine..."

UNAME=`uname -a`

# For Ubuntu
if [ ! -z "`echo $UNAME | grep Ubuntu`" ]; then
    sudo apt update;
    sudo apt install build-essential git wget unzip zlib1g-dev libpng-dev libjpeg-dev libbz2-dev libwebp-dev libogg-dev libvorbis-dev libfreetype-dev libasound2-dev libx11-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libxpm-dev mesa-common-dev cmake qt6-base-dev qt6-multimedia-dev libqt6core6 libqt6gui6 libqt6widgets6 libqt6opengl6-dev libqt6openglwidgets6 libqt6multimedia6 libqt6multimediawidgets6 libbrotli-dev
    git clone https://github.com/ktabata/polaris-engine;
    cd polaris-engine;
    ./configure;
    make;
    sudo make install;
    cd ..;
    echo "";
    echo "Please run 'polaris-engine'";
    exit 0;
fi

# For Debian
if [ ! -z "`echo $UNAME | grep Debian`" ]; then
    sudo apt update;
    sudo apt install build-essential git wget unzip zlib1g-dev libpng-dev libjpeg-dev libbz2-dev libwebp-dev libogg-dev libvorbis-dev libfreetype-dev libasound2-dev libx11-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libxpm-dev mesa-common-dev cmake qt6-base-dev qt6-multimedia-dev libqt6core6 libqt6gui6 libqt6widgets6 libqt6opengl6-dev libqt6openglwidgets6 libqt6multimedia6 libqt6multimediawidgets6 libbrotli-dev
    git clone https://github.com/ktabata/polaris-engine;
    cd polaris-engine;
    ./configure;
    make;
    sudo make install;
    cd ..;
    echo "";
    echo "Please run 'polaris-engine'";
fi

# For Kali
if [ ! -z "`echo $UNAME | grep Kali`" ]; then
    sudo apt update;
    sudo apt install build-essential git wget unzip zlib1g-dev libpng-dev libjpeg-dev libbz2-dev libwebp-dev libogg-dev libvorbis-dev libfreetype-dev libasound2-dev libx11-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libxpm-dev mesa-common-dev cmake qt6-base-dev qt6-multimedia-dev libqt6core6 libqt6gui6 libqt6widgets6 libqt6opengl6-dev libqt6openglwidgets6 libqt6multimedia6 libqt6multimediawidgets6 libbrotli-dev
    git clone https://github.com/ktabata/polaris-engine;
    cd polaris-engine;
    ./configure;
    make;
    sudo make install;
    cd ..;
    echo "";
    echo "Please run 'polaris-engine'";
fi

# For Fedora
if [ ! -z "`echo $UNAME | grep fedora`" ]; then
    sudo dnf install mingw64-gcc git zlib-devel libpng-devel libjpeg-turbo-devel bzip2-devel libwebp-devel libogg-devel libvorbis-devel freetype-devel alsa-lib-devel libX11-devel gstreamer1-devel gstreamer1-plugins-base-devel libXpm-devel mesa-libGL-devel cmake qt6-qtbase-devel qt6-qtmultimedia-devel brotli-devel
    git clone https://github.com/ktabata/polaris-engine;
    cd polaris-engine;
    ./configure;
    make;
    sudo make install;
    cd ..;
    echo "";
    echo "Please run 'polaris-engine'";
fi

# For RedHat
if [ ! -z "`echo $UNAME | grep RedHat`" ]; then
    sudo dnf install mingw64-gcc git zlib-devel libpng-devel libjpeg-turbo-devel bzip2-devel libwebp-devel libogg-devel libvorbis-devel freetype-devel alsa-lib-devel libX11-devel gstreamer1-devel gstreamer1-plugins-base-devel libXpm-devel mesa-libGL-devel cmake qt6-qtbase-devel qt6-qtmultimedia-devel brotli-devel
    git clone https://github.com/ktabata/polaris-engine;
    cd polaris-engine;
    ./configure;
    make;
    sudo make install;
    cd ..;
    echo "";
    echo "Please run 'polaris-engine'";
fi

# For FreeBSD
if [ ! -z "`echo $UNAME | grep FreeBSD`" ]; then
    sudo pkg update;
    sudo pkg install git gmake gsed unzip alsa-lib alsa-plugins qt6 xorg cmake mesa-devel freetype2;
    git clone https://github.com/ktabata/polaris-engine;
    cd polaris-engine;
    ./configure;
    gmake;
    sudo gmake install;
    cd ..;
    echo "";
    echo "Please run 'polaris-engine'";
fi

# For NetBSD
if [ ! -z "`echo $UNAME | grep NetBSD`" ]; then
    sudo pkg update;
    sudo pkg install git gmake gsed unzip alsa-lib alsa-plugins qt6 xorg cmake mesa-devel freetype2;
    git clone https://github.com/ktabata/polaris-engine;
    cd polaris-engine;
    ./configure;
    gmake;
    sudo gmake install;
    cd ..;
    echo "";
    echo "Please run 'polaris-engine'";
fi
