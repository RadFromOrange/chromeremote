import subprocess
import shutil
import sys
import os
import platform
import requests
import shutil


def install_chrome():
    # Download and install Chrome stable
    if platform.system() == "Linux":
        url = "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
        r = requests.get(url)
        with open("google-chrome-stable.deb", "wb") as f:
            f.write(r.content)
        subprocess.run(['sudo','dpkg', '-i', 'google-chrome-stable.deb'])

def install_deps():
    # Install other necessary dependencies
    if platform.system() == "Linux":
        subprocess.run(['sudo','apt-get', 'update'])
        subprocess.run(['sudo','apt','-y','--fix-broken','install'])
        subprocess.run(['sudo','apt-get', 'install', '-y', 'xvfb'])

        subprocess.run(['sudo','apt-get', 'install', '-y', 'tigervnc-standalone-server', 'tigervnc-common', 'tightvncserver','novnc', 'fluxbox'])

def bundle_deps():
    # Create a directory to hold bundled dependencies
    # os.makedirs("bundled_deps/novnc/")
  
    
    os.makedirs("bundled_deps2/")

    # subprocess.run(['cp','-r','/usr/share/novnc/','bundled_deps/'])
    # Source directory
    # subprocess.call('cp -r /opt/google/chrome/* bundled_deps')

    # subprocess.run(['cp','-r','/workspaces/puppeteer-screencast/websockify','bundled_deps/novnc/utils/'])


    # subprocess.run(['cp','-r','/home/codespace/.fluxbox/','bundled_deps/fax/'])

    # Copy required binaries and libraries to the bundled_deps directory
    # deps_to_copy = ['/usr/bin/Xvnc', '/usr/bin/vncserver','/usr/bin/openbox','/usr/bin/xauth' ]


    deps_to_copy = ['/usr/bin/Xvfb','/usr/bin/openbox-lxde', '/usr/bin/startlxde','/usr/bin/fluxbox','/usr/bin/startfluxbox','/usr/bin/xauth','/usr/bin/x11vnc',"/usr/bin/xkbwatch","/usr/bin/setxkbmap","/usr/bin/xkbevd","/usr/bin/xkbprint","/usr/bin/xkbbell","/usr/bin/xkbvleds","/usr/bin/xkbcomp" ]
    for dep in deps_to_copy:
        shutil.copy(dep, "bundled_deps2")

    # shutil.copyTree("/home/coder/noVNC/" , "bundled_deps2")

    # Determine library dependencies for each binary and copy them

    # deps_to_copy.append("/opt/google/chrome/chrome")
    # deps_to_copy.append("/usr/bin/google-chrome")
    for dep in deps_to_copy:
        output = subprocess.run(['ldd', dep], capture_output=True, text=True)
        libs = [line.split()[2] for line in output.stdout.split('\n') if '=>' in line]
        for lib in libs:
            shutil.copy(lib, "bundled_deps2")


def create_static_binary():
    # Convert the Python script along with the bundled dependencies into a single static binary
    if platform.system() == "Linux":        
        # subprocess.call("bash -c cp -r /opt/google/chrome/* bundled_deps/")
        subprocess.run(['pyinstaller', '--onefile', '--add-binary', 'bundled_deps:.', 'yourscript.py'])

def main():
    # install_chrome()
    # try :
    #     subprocess.call("bash -c rm -fr /workspaces/puppeteer-screencast/chromeremote/bundled_deps")
    # except :
    #     pass

    # install_deps()
    bundle_deps()
    # create_static_binary()

if __name__ == "__main__":
    main()