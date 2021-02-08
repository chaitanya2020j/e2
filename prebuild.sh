
BUILD_TYPE="Debug"
cd $WORKSPACE/RIC-E2-TERMINATION
sudo cp CMakeLists.txt ../
cd ..
wget https://github.com/Kitware/CMake/releases/download/v3.19.4/cmake-3.19.4-Linux-x86_64.sh
echo "y" >  /tmp/y
sh cmake-3.19.4-Linux-x86_64.sh < /tmp/y
export PATH="/w/workspace/ric-plt-e2-cmake-sonarqube/cmake-3.19.4-Linux-x86_64/bin:$PATH"
sudo apt-get update
sudo apt install libsctp-dev -y
sudo apt install lcov  -y\
    && wget --content-disposition https://github.com/cgreen-devs/cgreen/releases/download/1.2.0/cgreen_1.2.0_amd64.deb \
    && sudo dpkg -i cgreen_1.2.0_amd64.deb \
    && wget --content-disposition https://packagecloud.io/o-ran-sc/release/packages/debian/stretch/rmr_4.4.6_amd64.deb/download.deb \
    && sudo dpkg -i rmr_4.4.6_amd64.deb \
    && wget --content-disposition https://packagecloud.io/o-ran-sc/release/packages/debian/stretch/rmr-dev_4.4.6_amd64.deb/download.deb \
    && sudo dpkg -i rmr-dev_4.4.6_amd64.deb \
    && wget --content-disposition https://packagecloud.io/o-ran-sc/release/packages/debian/stretch/mdclog_0.0.4-1_amd64.deb/download.deb \
    && sudo dpkg -i mdclog_0.0.4-1_amd64.deb \
    && wget --content-disposition https://packagecloud.io/o-ran-sc/release/packages/debian/stretch/mdclog-dev_0.0.4-1_amd64.deb/download.deb \
    && sudo dpkg -i mdclog-dev_0.0.4-1_amd64.deb \
    && sudo apt-get install -y libcurl4-gnutls-dev gawk libtbb-dev  libtbb-doc libtbb2 libtbb2-dbg \
    && cd RIC-E2-TERMINATION/3rdparty && git clone https://github.com/oktal/pistache.git && cd pistache \
    && sudo git submodule update --init \
    && sudo ldconfig \
    && cd $WORKSPACE/RIC-E2-TERMINATION/3rdparty && git clone -v https://github.com/jupp0r/prometheus-cpp.git \
    && cd prometheus-cpp && git submodule init && git submodule update && mkdir build && cd build \
    && sudo ldconfig \
    && cd $WORKSPACE/RIC-E2-TERMINATION/3rdparty && git clone https://github.com/jarro2783/cxxopts.git \
    && cd $WORKSPACE/RIC-E2-TERMINATION/3rdparty && git clone https://github.com/Tencent/rapidjson.git \
    && cd $WORKSPACE/RIC-E2-TERMINATION/3rdparty && git clone https://github.com/zeux/pugixml.git \
    && cd $WORKSPACE && git clone https://github.com/bilke/cmake-modules.git

