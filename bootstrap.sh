#!/bin/bash
# Execute scrip like so:
# sh doubango/bootstrap.sh
#yum update -y
#yum install -y  make libtool autoconf subversion git wget cmake gcc gcc-c++ pkgconfig nano vim

# Build libsrtp - Recommended for WebRTC SIP clients.
#git clone https://github.com/cisco/libsrtp/
#cd libsrtp
#CFLAGS="-fPIC" ./configure --enable-pic && make && make install

# OpenSSL version 1.0.1 is already installed by default in Centos 6.7 +

yum -y install libogg-devel libvorbis-devel libtheora-devel