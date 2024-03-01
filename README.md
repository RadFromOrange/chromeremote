# chromeremote


XDG_RUNTIME_DIR=/workspaces/puppeteer-extra-plugin-portal /home/codespace/.cache/puppeteer/chrome/linux-118.0.5993.70/chrome-linux64/chrome  --disable-gpu --remote-debugging-port=9222 --headless=true --ignore-certificate-errors --remote-allow-origins=https://psychic-acorn-wg5w44r9jgpf5q44-9222.app.github.dev http://127.0.0.1:8000 

ws ---> wss 

nginx proxy running on 10443

sudo nginx  -c /workspaces/puppeteer-extra-plugin-portal/zebi.conf

through external chrome :

https://zany-goldfish-4wvxrrjg97pcqr5w-9222.app.github.dev/json/list  ---> 

[ {
   "description": "",
   "devtoolsFrontendUrl": "/devtools/inspector.html?ws=localhost:9222/devtools/page/3577313413AD010B80AB8F344996C00A",
   "id": "3577313413AD010B80AB8F344996C00A",
   "title": "Directory listing for /",
   "type": "page",
   "url": "http://127.0.0.1:8000/",
   "webSocketDebuggerUrl": "ws://localhost:9222/devtools/page/3577313413AD010B80AB8F344996C00A"
} ]


https://zany-goldfish-4wvxrrjg97pcqr5w-14443.app.github.dev/devtools/inspector.html?wss=zany-goldfish-4wvxrrjg97pcqr5w-14443.app.github.dev/devtools/page/3577313413AD010B80AB8F344996C00A


https://psychic-acorn-wg5w44r9jgpf5q44-9222.app.github.dev/devtools/inspector.html?ws=localhost:9222/devtools/page/7B5A326C00968CB341D9937F4FD01571

replace localhost:9222 with nginx ssl proxy psychic-acorn-wg5w44r9jgpf5q44-14443.app.github.dev
replace ws with wss

https://psychic-acorn-wg5w44r9jgpf5q44-9222.app.github.dev/devtools/inspector.html?wss=psychic-acorn-wg5w44r9jgpf5q44-14443.app.github.dev/devtools/page/7B5A326C00968CB341D9937F4FD01571


VNC novnc

install novnc server 

./utils/novnc_proxy 

install vncserver sudo apt install tigervnc-standalone-server tigervnc-common tightvncserver 

vncpasswd
vncserver -localhost no

vim  ~/.vnc/xstartup

exmaple of ~/.vnc/xstartup:
------------
#!/bin/sh
startfluxbox & xterm & /home/codespace/.cache/puppeteer/chrome/linux-118.0.5993.70/chrome-linux64/chrome --no-sandbox --disable-dev-shm-usage --disable-software-rasterizer --disable-gpu --remote-debugging-port=9222 https://www.google.com
---------------
vncserver -rfbport 5900



************************************************************


# chromeremote


XDG_RUNTIME_DIR=/workspaces/puppeteer-extra-plugin-portal /home/codespace/.cache/puppeteer/chrome/linux-118.0.5993.70/chrome-linux64/chrome  --disable-gpu --remote-debugging-port=9222 --headless=true --ignore-certificate-errors --remote-allow-origins=https://psychic-acorn-wg5w44r9jgpf5q44-9222.app.github.dev http://127.0.0.1:8000 

ws ---> wss 

nginx proxy running on 10443

sudo nginx  -c /workspaces/puppeteer-extra-plugin-portal/zebi.conf

through external chrome :


https://psychic-acorn-wg5w44r9jgpf5q44-9222.app.github.dev/devtools/inspector.html?ws=localhost:9222/devtools/page/7B5A326C00968CB341D9937F4FD01571

replace localhost:9222 with nginx ssl proxy psychic-acorn-wg5w44r9jgpf5q44-14443.app.github.dev
replace ws with wss

https://psychic-acorn-wg5w44r9jgpf5q44-9222.app.github.dev/devtools/inspector.html?wss=psychic-acorn-wg5w44r9jgpf5q44-14443.app.github.dev/devtools/page/7B5A326C00968CB341D9937F4FD01571


VNC novnc

install novnc server 

./utils/novnc_proxy 

install vncserver sudo apt install tigervnc-standalone-server tigervnc-common tightvncserver 

vncpasswd
vncserver -localhost no

vim  ~/.vnc/xstartup

exmaple of ~/.vnc/xstartup:
------------
#!/bin/sh
startfluxbox & xterm & /home/codespace/.cache/puppeteer/chrome/linux-118.0.5993.70/chrome-linux64/chrome --no-sandbox --disable-dev-shm-usage --disable-software-rasterizer --disable-gpu --remote-debugging-port=9222 https://www.google.com
---------------
vncserver -rfbport 5900

--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
sudo apt-get install xfvb vncserver sudo apt install tigervnc-standalone-server tigervnc-common tightvncserver
sudo apt install fluxbox

Launch virtual screen:

Xvfb -ac :12 -screen 0 1280x1024x16 &
export DISPLAY=:12

Configure startup script: 

~/.vnc/xstartup
--------------------------
#!/bin/sh 
startfluxbox &
/home/codespace/.cache/puppeteer/chrome/linux-122.0.6261.69/chrome-linux64/chrome --disable-gpu  --no-sandbox  --disable-dev-shm-usage --disable-software-rasterizer &
-------------------------
Launch vncserver

vncserver -SecurityTypes None -rfbport 5778

Launch novnc 

/usr/share/novnc/utils/launch.sh --vnc localhost:5778










