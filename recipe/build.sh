#!/bin/sh
mkdir build
cd build

cmake ${CMAKE_ARGS} .. \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DLIB_POSTFIX="" \
      -DBUILD_OSG_EXAMPLES=ON

make -j${CPU_COUNT}
make install

# Manual install the data needed for the example
cd ..
cp -r examples_data $PREFIX/share/OpenSceneGraph
