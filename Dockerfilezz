FROM ubuntu

# Set environment variable to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages including Git, Python 3, and Thorium browser dependencies
RUN apt-get update && apt-get install -qqy x11-apps x11vnc xvfb wget net-tools git python3 libgbm1 unzip

# Download Thorium browser and extract it
RUN  rm -fv /etc/apt/sources.list.d/thorium.list &&  wget --no-hsts -P /etc/apt/sources.list.d/  http://dl.thorium.rocks/debian/dists/stable/thorium.list &&  apt update &&  apt install -y thorium-browser

# Expose port 5900 for VNC
EXPOSE 5900

# Set up Xvfb and x11vnc
RUN mkdir ~/.vnc \
    && x11vnc -storepasswd 1234 ~/.vnc/passwd

# Download and extract noVNC files
RUN mkdir -p /usr/share/novnc \
    && wget -qO- https://github.com/novnc/noVNC/archive/v1.2.0.tar.gz | tar xz --strip 1 -C /usr/share/novnc

# Set up a startup script to start x11vnc, Thorium browser, and noVNC
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Start Xvfb, x11vnc, Thorium browser, and noVNC server when container starts
CMD ["/usr/local/bin/start.sh"]
