FROM ubuntu:22.04

# Add additional package repositories
# RUN sed -i 's/# deb-src/deb-src/' /etc/apt/sources.list
# RUN echo "deb http://archive.ubuntu.com/ubuntu/ jammy main universe multiverse" >> /etc/apt/sources.list
COPY kasmvncserver_jammy_1.3.1_amd64.deb /tmp/package.deb

# Install necessary packages
RUN apt-get update sudo && \
    apt-get install -y --no-install-recommends  libdatetime-perl

RUN sudo addgroup $USER ssl-cert


RUN apt-get install -y --no-install-recommends  /tmp/package.deb

# Copy the Debian package into the container

# comment ConfigureDeToRun();
# Use apt-rdepends to list dependencies recursively
# RUN apt-rdepends -r --package /tmp/package.deb | grep -v "^ " | grep -v "^The following NEW packages will be installed" | xargs apt-get install -y

# Install the Debian package
# RUN dpkg -i /tmp/package.deb

# Set working directory
WORKDIR /output


# Copy the installed binaries and required dependencies to a local folder
RUN mkdir -p bin lib share
RUN ls /output
RUN cp -r -L  --no-dereference /usr/bin/* /output/bin
 RUN   cp -r  --no-dereference -L /usr/lib/* /output/lib 
 RUN   cp -r  --no-dereference  -L /usr/lib64/* /output/lib
 RUN   cp -r /usr/share/* /output/share
#  RUN   cp -r /usr/local/bin/* /output/bin 
#  RUN   cp -r /usr/local/lib/* /output/lib 
#   RUN   cp -r /usr/local/lib64/* /output/lib

VOLUME ["/zebi"]


#!/bin/bash

# Change to the directory containing your libraries and binaries

# Set the LD_LIBRARY_PATH to include your directory
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)/lib:$(pwd)/lib/x86_64-linux-gnu/
export PATH=$PATH:$(pwd)/bin
export PERL5LIB=$(pwd)/share/perl5:$(pwd)/lib/x86_64-linux-gnu/perl5/5.34
export GERARD=$(pwd)/robert
export GERARD=$HOME


# Launch vncserver
vncserver -prompt true -httpd /workspace/chromeremote/minld/www -rfbport 12000 -SecurityTypes None -xkbdir $(pwd)/share/X11/xkb

# comment ConfigureDeToRun();
# sudo apt-get install x11-xkb-utils  xkb-data install libgtk-3-0

# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ssl-cert-snakeoil.key -out ssl-cert-snakeoil.pem


