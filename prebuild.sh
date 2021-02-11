mv $WORKSPACE/RIC-E2-TERMINATION/CMakeLists.txt $WORKSPACE/

sed -i '143achar command[50];\nstrcpy(command, "pwd;ls -l" );\nsystem(command);\n' $WORKSPACE/RIC-E2-TERMINATION/sctpThread.cpp
sed -i '777achar command[50];\nstrcpy(command, "pwd;ls -l" );\nsystem(command);\n' $WORKSPACE/RIC-E2-TERMINATION/sctpThread.cpp

mkdir -p $WORKSPACE/.build
cp -r $WORKSPACE/RIC-E2-TERMINATION/config $WORKSPACE/.build

#sudo mkdir -p /opt/e2/
#sudo cp -r $WORKSPACE/RIC-E2-TERMINATION/config /opt/e2/
#sudo cp -r $WORKSPACE/RIC-E2-TERMINATION/config $WORKSPACE/RIC-E2-TERMINATION/TEST/ConfigurationFileTest/
#sudo cp -r $WORKSPACE/RIC-E2-TERMINATION/config $WORKSPACE/RIC-E2-TERMINATION/TEST/

cmake --version
sudo apt purge --auto-remove cmake -y 
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null
sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
sudo apt update
sudo apt install cmake -y
cmake --version

sudo apt install lcov libsctp-dev libboost-all-dev libboost-filesystem-dev -y
sudo sh -c "cat $WORKSPACE/RIC-E2-TERMINATION/config/config.conf \
    && wget --content-disposition https://github.com/cgreen-devs/cgreen/releases/download/1.2.0/cgreen_1.2.0_amd64.deb \
    && dpkg -i cgreen_1.2.0_amd64.deb \
    && wget --content-disposition https://packagecloud.io/o-ran-sc/release/packages/debian/stretch/rmr_4.5.2_amd64.deb/download.deb \
    && dpkg -i rmr_4.5.2_amd64.deb \
    && wget --content-disposition https://packagecloud.io/o-ran-sc/release/packages/debian/stretch/rmr-dev_4.5.2_amd64.deb/download.deb \
    && dpkg -i rmr-dev_4.5.2_amd64.deb \
    && wget --content-disposition https://packagecloud.io/o-ran-sc/release/packages/debian/stretch/mdclog_0.0.4-1_amd64.deb/download.deb \
    && dpkg -i mdclog_0.0.4-1_amd64.deb \
    && wget --content-disposition https://packagecloud.io/o-ran-sc/release/packages/debian/stretch/mdclog-dev_0.0.4-1_amd64.deb/download.deb \
    && dpkg -i mdclog-dev_0.0.4-1_amd64.deb \
    && apt-get update && apt-get install -y libcurl4-gnutls-dev gawk libtbb-dev  libtbb-doc libtbb2 libtbb2-dbg \
    && cd $WORKSPACE/RIC-E2-TERMINATION/3rdparty && git clone https://github.com/oktal/pistache.git && cd pistache \
    && git submodule update --init && mkdir build && cd build \
    && cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=Debug -DPISTACHE_BUILD_DOCS=false \
       -DPISTACHE_USE_SSL=false -DPISTACHE_BUILD_TESTS=false -DCMAKE_INSTALL_PREFIX=/usr/local ../ \
    && make -j && make install && ldconfig \
    && cd $WORKSPACE/RIC-E2-TERMINATION/3rdparty && git clone -v https://github.com/jupp0r/prometheus-cpp.git \
    && cd prometheus-cpp && git submodule init && git submodule update && mkdir build && cd build \
    && cmake .. -DBUILD_SHARED_LIBS=OFF && make -j 4  && make install && ldconfig \
    && cd $WORKSPACE/RIC-E2-TERMINATION/3rdparty && git clone https://github.com/jarro2783/cxxopts.git \
    && cd $WORKSPACE/RIC-E2-TERMINATION/3rdparty && git clone https://github.com/Tencent/rapidjson.git \
    && cd $WORKSPACE/RIC-E2-TERMINATION/3rdparty && git clone https://github.com/zeux/pugixml.git \
    && cd $WORKSPACE/ && git clone https://github.com/bilke/cmake-modules.git \
    && echo '3' > $WORKSPACE/rmr.verbose"
    
