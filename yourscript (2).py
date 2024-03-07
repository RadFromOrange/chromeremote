import subprocess
import os
import sys
import argparse

def launch_vnc(vncport):
    script_dir = sys._MEIPASS if getattr(sys, 'frozen', False) else os.path.dirname(os.path.abspath(__file__))
    xvfb_path = os.path.join(script_dir, "bundled_deps", "Xvfb")
    os.environ['LD_LIBRARY_PATH'] = os.path.join(script_dir, "bundled_deps") + ":" + os.environ['LD_LIBRARY_PATH']
    os.environ['PATH'] =  os.path.join(script_dir, "bundled_deps") + os.pathsep + os.environ['PATH']
    startup_script_path = os.path.join(script_dir, "bundled_deps", "xstartup")
    print("lauching XVFB " + xvfb_path)
    subprocess.Popen([xvfb_path, '-ac', ':12', '-screen', '0', '1280x1024x16'])
    os.environ['DISPLAY'] = ':12'
    vncserver_path = os.path.join(script_dir, "bundled_deps", "vncserver")
    vncserver_process = subprocess.Popen([vncserver_path, '-SecurityTypes', 'None', '-rfbport', str(vncport), '-xstartup', startup_script_path])
    vncserver_process.wait()
    print("VNC server launched successfully")

def launch_noVNC(script_dir,vncport, novncport):
    print("LAUNCHING NOVNC ------------------------")
    launch_script_path = os.path.join(script_dir, "bundled_deps", "novnc", "utils", "launch.sh") 
    web_path = os.path.join(script_dir, "bundled_deps", "novnc") 
    vncserver_process = subprocess.Popen([launch_script_path, '--vnc', f'localhost:{vncport}','--listen',  f'localhost:{novncport}'])
    vncserver_process.wait()
    print("noVNC launched successfully")

def configure_startup_script(startup_script_path):
    print("startup_script_path " + startup_script_path)
    if not os.path.exists(startup_script_path):
        print("startup_script_path " + startup_script_path)
        with open(startup_script_path, 'w') as f:
            f.write("""#!/bin/sh\nstartfluxbox &\ngoogle-chrome --disable-gpu --no-sandbox --disable-dev-shm-usage --disable-software-rasterizer &""")
        os.chmod(startup_script_path, 0o755)  # Set executable permission
        print("Startup script created successfully") 

        # DISPLAY=:12 /tmp/_MEIkD6rrI/bundled_deps/google-chrome --disable-gpu --no-sandbox --disable-dev-shm-usage --disable-software-rasterizer

def stop_vnc():
    # Stop the VNC server
    os.system("pkill Xvfb")
    os.system("pkill Xtigervnc")


def main():
    parser = argparse.ArgumentParser(description='Launch VNC and noVNC.')
    parser.add_argument('--start', action='store_true', help='Start the servers')
    parser.add_argument('--stop', action='store_true', help='Stop the servers')
    parser.add_argument('--vncport', type=int, default=5778, help='VNC port')
    parser.add_argument('--novncport', type=int, default=6080, help='noVNC port')
    args = parser.parse_args()

    if args.start:
        script_dir = sys._MEIPASS if getattr(sys, 'frozen', False) else os.path.dirname(os.path.abspath(__file__))
        startup_script_path = os.path.join(script_dir, "bundled_deps", "xstartup")
        configure_startup_script(startup_script_path)
        launch_vnc(args.vncport)
        launch_noVNC(script_dir, args.vncport,args.novncport)
    elif args.stop:
        stop_vnc()

if __name__ == "__main__":
    main()
