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
