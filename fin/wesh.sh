#!/bin/bash

# Change to the directory containing your libraries and binaries

# sudo apt-get install   libdatetime-perl  libtry-tiny-perl

#  echo "./kasmvncpasswd" >  ./usr/bin/vncpasswd
#  echo "./Xkasmvnc" > ./usr/bin/Xvnc

# Set the LD_LIBRARY_PATH to include your directory
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)/usr/lib:$(pwd)/usr/lib/x86_64-linux-gnu/
export PATH=$PATH:$(pwd)/bin:$(pwd)/usr/bin
export PERL5LIB=$(pwd)/usr/share/perl5:$(pwd)/usr/lib/x86_64-linux-gnu/perl5/5.36
export ALBERT_VNC=$(pwd)/usr/share/kasmvnc/kasmvnc_defaults.yaml

kasmvncserver -prompt true -httpd /workspace/chromeremote/minld/www -rfbport 12000 -SecurityTypes None -xkbdir /workspace/chromeremote/zribi/usr/share/X11/xkb
