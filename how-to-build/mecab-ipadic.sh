#!/bin/bash
export CFLAGS=
CURRENT_DIR="$(pwd)"
INSTALL_DIR="$CURRENT_DIR/build/ipadic/usr/local"
mkdir -p "$INSTALL_DIR/lib"

curl -Lo mecab-ipadic-2.7.0-20070801.tar.gz 'https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7MWVlSDBCSXZMTXM'

tar xvf mecab-ipadic-2.7.0-20070801.tar.gz

cd mecab-ipadic-2.7.0-20070801
make clean
"$(pwd)/configure" --with-charset=utf8 --host=arm-apple-darwin --build=arm-apple-darwin --prefix="/usr/local"&&make&&make check&&make install&&cp -r /usr/local/lib/mecab $INSTALL_DIR/lib/
make uninstall
cd $CURRENT_DIR

#cp mecab-ipadic-2.7.0-20070801/*.csv $INSTALL_DIR/lib/mecab/dic/ipadic