#!/bin/bash

git clone root@10.74.120.150:/home/cjling/proj/zsh
git clone root@10.74.120.150:/home/cjling/proj/autojump
git clone root@10.74.120.150:/home/cjling/proj/oh-my-zsh

cd zsh
./Util/preconfig
./configure
make
make install

cd ..

cd autojump
./install.py

cd ..

cd oh-my-zsh
sh -x link.sh
