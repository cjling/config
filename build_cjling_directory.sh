#!/bin/bash

cjling_work_root_dir='/home/cjling'

cjling_work_dirs=(proj \
                  package \
                  repo \
                  vm \
                  mnt \
                  xxxx)

for dir in ${cjling_work_dirs[@]}; do
    sudo mkdir -p $cjling_work_root_dir/$dir
done
