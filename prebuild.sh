sudo apt install lcov -y


#ARG BUILD_TYPE="Release"
BUILD_TYPE="Debug"

wget https://github.com/Kitware/CMake/releases/download/v3.19.4/cmake-3.19.4-Linux-x86_64.sh
echo "y" >  /tmp/y
sh cmake-3.19.4-Linux-x86_64.sh < /tmp/y
ls ..
export PATH="/w/workspace/ric-plt-e2-cmake-sonarqube/cmake-3.19.4-Linux-x86_64/bin:$PATH"
pwd
ls
sudo apt-get update
sudo apt install lcov -y\
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
    && mkdir -p RIC-E2-TERMINATION/cmake-modules \
    && wget https://github.com/bilke/cmake-modules/blob/master/CodeCoverage.cmake -O RIC-E2-TERMINATION/cmake-modules/CodeCoverage.cmake
sudo ls -lR
