#!/bin/bash

git clone root@10.74.120.150:/home/cjling/proj/oh-my-zsh
yum install zsh
yum install autojump-zsh
sh -x ./oh-my-zsh/link.sh
