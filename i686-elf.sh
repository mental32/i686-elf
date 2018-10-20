#!/bin/bash

BINUTILS_VERSION=2.31
GCC_VERSION=8.2.0
GDB_VERSION=8.2

BUILD_DIR="$HOME/build-i686-elf"
export PATH="$BUILD_DIR/output/bin:$PATH"


function main {
    mkdir -pv $BUILD_DIR
    cd $BUILD_DIR

    downloadAll
    compileAll
}

function downloadAll {
    echo "Downloading sources..."

    downloadAndExtract "binutils" $BINUTILS_VERSION
    downloadAndExtract "gcc" $GCC_VERSION
    downloadAndExtract "gdb" $GDB_VERSION
}

function downloadAndExtract {
    name=$1
    version=$2
    override=$3

    echo "Processing $name"    
    echo "Downloading $name-$version.tar.gz"

    if [[ $name == *"gcc"* ]]; then
        wget http://ftp.gnu.org/gnu/gcc/gcc-$GCC_VERSION/gcc-$GCC_VERSION.tar.gz
    else
        wget http://ftp.gnu.org/gnu/$name/$name-$version.tar.gz
    fi

    echo "Extracting $name-$version.tar.gz"
    tar -xf $name-$version.tar.gz
    rm -f $name-$version.tar.gz
}

function compileAll {
    echo "Compiling toolkit"

    compileBinutils
    compileGCC
    compileGDB
}

function compileBinutils {    
    echo "Compiling binutils"

    mkdir -p build-binutils-$BINUTILS_VERSION
    cd build-binutils-$BINUTILS_VERSION
    
    configureArgs="--target=i686-elf --with-sysroot --disable-nls --disable-werror --prefix=$BUILD_DIR/$1/output"

    ../binutils-$BINUTILS_VERSION/configure $configureArgs

    make

    sudo make install
    cd ..
}

function compileGCC {
    echo "Compiling gcc"

    mkdir -p build-gcc-$GCC_VERSION
    cd build-gcc-$GCC_VERSION
    
    configureArgs="--target=i686-elf --disable-nls --enable-languages=c,c++ --without-headers --prefix=$BUILD_DIR/$1/output"

    ../gcc-$GCC_VERSION/configure $configureArgs >> gcc_configure.log
    
    make all-gcc

    sudo make install-gcc

    make all-target-libgcc

    sudo make install-target-libgcc

    cd ..
}

function compileGDB {
    echo "Compiling gdb"

    configureArgs="--target=i686-elf --disable-nls --disable-werror --prefix=$BUILD_DIR/$1/output"

    mkdir -p build-gdb-$GDB_VERSION
    cd build-gdb-$GDB_VERSION

    ../gdb-$GDB_VERSION/configure $configureArgs

    make

    sudo make install
    cd ..
}

main
