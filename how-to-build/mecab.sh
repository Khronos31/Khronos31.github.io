#!/bin/bash
export CFLAGS=
CURRENT_DIR="$(pwd)"
INSTALL_DIR="$CURRENT_DIR/build/mecab/usr/local"
mkdir -p "$INSTALL_DIR"

curl -Lo mecab-0.996.tar.gz 'https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7cENtOXlicTFaRUE'

tar xvf mecab-0.996.tar.gz

cd mecab-0.996/
make clean
"$(pwd)/configure" --with-charset=utf8 --host=arm-apple-darwin --build=arm-apple-darwin --prefix="/usr/local"&&make&&make check&&make install prefix="$INSTALL_DIR"
cd $CURRENT_DIR
