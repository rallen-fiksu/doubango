#!/bin/bash
# Execute scrip like so:
# sh doubango/bootstrap.sh
yum update -y
yum install -y  make libtool autoconf subversion git wget cmake gcc gcc-c++ pkgconfig nano vim

# Build libsrtp - Recommended for WebRTC SIP clients.
git clone https://github.com/cisco/libsrtp/
cd libsrtp
CFLAGS="-fPIC" ./configure --enable-pic && make && make install

# OpenSSL version 1.0.1 is already installed by default in Centos 6.7 +

yum -y install libogg-devel libvorbis-devel libtheora-devel speex-devel libvpx-devel gsm-devel freetype-devel

wget http://downloads.xiph.org/releases/speex/speex-1.2beta3.tar.gz
tar -xvzf speex-1.2beta3.tar.gz
cd speex-1.2beta3
./configure --disable-oggtest --without-libogg && make && make install
cd ~/work/

wget http://www.tortall.net/projects/yasm/releases/yasm-1.2.0.tar.gz
tar -xvzf yasm-1.2.0.tar.gz
cd yasm-1.2.0
./configure && make && make install
cd ~/work/

git clone git://opencore-amr.git.sourceforge.net/gitroot/opencore-amr/opencore-amr
cd opencore-amr
autoreconf --install && ./configure && make && make install
cd ~/work/

wget http://downloads.xiph.org/releases/opus/opus-1.0.2.tar.gz
tar -xvzf opus-1.0.2.tar.gz
cd opus-1.0.2
./configure --with-pic --enable-float-approx && make && make install
cd ~/work/

svn co http://g729.googlecode.com/svn/trunk/ g729b
cd g729b
./autogen.sh && ./configure --enable-static --disable-shared && make && make install
cd ~/work/

svn co http://doubango.googlecode.com/svn/branches/2.0/doubango/thirdparties/scripts/ilbc
cd ilbc
wget http://www.ietf.org/rfc/rfc3951.txt
awk -f extract.awk rfc3951.txt
./autogen.sh && ./configure
make && make install
cd ~/work/

wget ftp://ftp.videolan.org/pub/x264/snapshots/last_x264.tar.bz2
tar -xvjf last_x264.tar.bz2
# the output directory may be difference depending on the version and date
cd x264-snapshot-20160415-2245
./configure --enable-shared --enable-pic && make && make install
cd ~/work/

#failing
#wget http://downloads.sourceforge.net/faac/faac-1.28.tar.bz2
#tar -xvjf faac-1.28.tar.bz2
#cd faac-1.28 && ./configure && make && make install
#cd ~/work/

# [1] checkout source code
git clone git://source.ffmpeg.org/ffmpeg.git ffmpeg
cd ffmpeg
# [2] grap a release branch
git checkout n1.2
# [3] configure source
./configure --extra-cflags="-fPIC" --extra-ldflags="-lpthread" --enable-pic --enable-memalign-hack --enable-pthreads --enable-shared --disable-static --disable-network --enable-pthreads --disable-ffmpeg --disable-ffplay --disable-ffserver --disable-ffprobe --enable-gpl --disable-debug --enable-libfreetype --enable-libfaac --enable-nonfree --enable-libx264
# [4] build and install
make && make install
cd ~/work/

wget http://kcat.strangesoft.net/openal-releases/openal-soft-1.15.1.tar.bz2
tar -xvjf openal-soft-1.15.1.tar.bz2
cd openal-soft-1.15.1/build
cmake ..
make && make install
cd ~/work/

## Application (x64) ##
#wget http://sourceforge.net/projects/openofficeorg.mirror/files/4.0.0/binaries/enUS/Apache_OpenOffice_4.0.0_Linux_x86-64_install-rpm_en-US.tar.gz
#mkdir -p OpenOfficeApplication && tar -zxvf Apache_OpenOffice_4.0.0_Linux_x86-64_install-rpm_en-US.tar.gz -C OpenOfficeApplication
#rpm -Uvih OpenOfficeApplication/en-US/RPMS/*rpm
#cd ~/work/

## SDK (x64) ##
#wget http://sourceforge.net/projects/openofficeorg.mirror/files/4.0.0/binaries/SDK/Apache_OpenOffice-SDK_4.0.0_Linux_x86-64_install-rpm_en-US.tar.gz
#mkdir -p OpenOfficeSDK && tar -zxvf Apache_OpenOffice-SDK_4.0.0_Linux_x86-64_install-rpm_en-US.tar.gz -C OpenOfficeSDK
#rpm -Uvih OpenOfficeSDK/en-US/RPMS/*rpm

#LD_LIBRARY_PATH=/opt/openoffice4/program:/opt/openoffice4/sdk/lib /opt/openoffice4/sdk/bin/cppumaker -BUCR -O /opt/openoffice4/sdk/includecpp /opt/openoffice4/program/types.rdb
#cd ~/work/