export XORG_PREFIX=bundled_deps 
export LD_LIBRARY_PATH=bundled_deps/ 

bundled_deps/Xvfb -ac :14 -screen 0 1280x1024x16 -xkbdir bundled_deps/share/X11/xkb &


export DISPLAY=:14 
bundled_deps/x11vnc -display :14 -noxdamage -forever -rfbport 5901 -shared &
noVNC/utils/novnc_proxy --vnc localhost:5901 &
openbox-session &
chromium --no-sandbox -disable-dev-shm-usage --ignore-certificates-errors --disable-gpu --start-maximized &



# XORG_PREFIX=~/onestfoutu/op-valea-services-develop/minld/bundled_deps LD_LIBRARY_PATH=~/onestfoutu/op-valea-services-develop/minld/bundled_deps/ bundled_deps/Xvfb -ac :14 -screen 0 1280x1024x16 -xkbdir ~/onestfoutu/op-valea-services-develop/minld/bundled_deps/share/X11/xkb