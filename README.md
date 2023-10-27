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
