#!/bin/bash
# Execute scrip like so:
# sh doubango/bootstrap.sh
#yum update -y
#yum install -y  make libtool autoconf subversion git wget cmake gcc gcc-c++ pkgconfig nano vim

# Build libsrtp - Recommended for WebRTC SIP clients.
git clone https://github.com/cisco/libsrtp/
cd libsrtp
CFLAGS="-fPIC" ./configure --enable-pic && make && make install

# OpenSSL version 1.0.1 is already installed by default in Centos 6.7 +

yum -y install libogg-devel libvorbis-devel libtheora-devel speex-devel libvpx-devel gsm-devel

wget http://downloads.xiph.org/releases/speex/speex-1.2beta3.tar.gz
tar -xvzf speex-1.2beta3.tar.gz
cd speex-1.2beta3
./configure --disable-oggtest --without-libogg && make && make install

wget http://www.tortall.net/projects/yasm/releases/yasm-1.2.0.tar.gz
tar -xvzf yasm-1.2.0.tar.gz
cd yasm-1.2.0
./configure && make && make install

git clone git://opencore-amr.git.sourceforge.net/gitroot/opencore-amr/opencore-amr
cd opencore-amr
autoreconf --install && ./configure && make && make install

wget http://downloads.xiph.org/releases/opus/opus-1.0.2.tar.gz
tar -xvzf opus-1.0.2.tar.gz
cd opus-1.0.2
./configure --with-pic --enable-float-approx && make && make install

svn co http://g729.googlecode.com/svn/trunk/ g729b
cd g729b
./autogen.sh && ./configure --enable-static --disable-shared && make && make install