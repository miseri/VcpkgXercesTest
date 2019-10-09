#!/bin/bash

if [ ! -f ../vcpkg ]; then
  git submodule update --init
fi

cd ../vcpkg
if [ ! -f vcpkg ]; then
  echo "vcpkg does not exist - building"
  if [ ! -f bootstrap-vcpkg.sh ]; then
    git submodule update --init
  fi
  ./bootstrap-vcpkg.sh
fi

./vcpkg install xerces-c
cd ..

mkdir -p build
cd build

# cmake -DCMAKE_TOOLCHAIN_FILE=../vcpkg/scripts/buildsystems/vcpkg.cmake ..  -DXercesC_DIR=../libs/vcpkg/installed/x86-windows/share/xercesc
cmake -DCMAKE_TOOLCHAIN_FILE=../vcpkg/scripts/buildsystems/vcpkg.cmake .. 

cmake --build . --config Release 
cd ../scripts  
