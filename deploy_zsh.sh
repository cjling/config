#!/bin/bash

git clone root@10.74.120.150:/home/cjling/proj/zsh
git clone root@10.74.120.150:/home/cjling/proj/autojump
git clone root@10.74.120.150:/home/cjling/proj/oh-my-zsh

cd /home/cjling/proj/zsh
./Util/preconfig
./configure
make
make install

cd /home/cjling/proj/autojump
./install.py

cd /home/cjling/proj/oh-my-zsh
sh -x link.sh
