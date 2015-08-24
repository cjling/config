#!/bin/bash

cjling_work_root_dir='/home/cjling'

cjling_work_dirs=(001_proj \
                  002_package \
                  003_repo \
                  004_vm \
                  005_mnt \
                  100_xxxx)

for dir in ${cjling_work_dirs[@]}; do
    sudo mkdir -p $cjling_work_root_dir/$dir
done
