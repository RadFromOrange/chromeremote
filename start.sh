#!/bin/bash

# Start Xvfb
Xvfb :0 -screen 0 1920x1080x24 &

# Start x11vnc
x11vnc -display :0 -forever -usepw -create -rfbport 5900 &

# Start xeyes
DISPLAY=:0 /opt/Thorium/Thorium &

# Start noVNC server
/usr/share/novnc/utils/launch.sh --vnc localhost:5900
