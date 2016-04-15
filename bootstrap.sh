#!/bin/bash
# Execute scrip like so:
# sh work/bootstrap.sh
#yum update -y
#yum install -y  make libtool autoconf subversion git wget cmake gcc gcc-c++ pkgconfig

# Build libsrtp - Recommended for WebRTC SIP clients.
git clone https://github.com/cisco/libsrtp/
cd libsrtp
CFLAGS="-fPIC" ./configure --enable-pic && make && make install