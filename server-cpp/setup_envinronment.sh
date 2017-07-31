sudo apt-get update
sudo apt-get install -y build-essential autoconf libtool
sudo apt-get install -y libgflags-dev libgtest-dev
sudo apt-get install -y clang libc++-dev
sudo apt-get install -y automake curl make g++ unzip
mkdir lib
cd lib
git clone https://github.com/google/protobuf.git
cd protobuf
./autogen.sh
./configure
make check
sudo make install
sudo ldconfig
cd ..
git clone -b $(curl -L https://grpc.io/release) https://github.com/grpc/grpc
cd grpc
git submodule update --init
make
sudo make install
