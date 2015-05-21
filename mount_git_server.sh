#!/bin/bash

#server ip
pc_ip='10.74.30.154'

#server password
password='916sa((('

#local git directionay
git_server='/home/cjling/006_git_server'

#proj_names
proj_svn_names=(ZXCCP-VPlat_CVM-trunk-source.repo-src-openstack-nova \
                ZXCCP-VPlat_CVM-trunk-source.repo-src-python-novaclient \
                ZXCCP-VPlat_CVM-trunk-source.repo-src-openstack-cinder \
                ZXCCP-VPlat_CVM-trunk-source.repo-src-openstack-neutron)
proj_git_names=(k-vim leetcode linux_package linux_setting oh-my-zsh)

#paths
path_git='clone_from_git'
path_svn='clone_from_svn'

for proj_name in ${proj_git_names[@]}; do
    mkdir $git_server/$proj_name
    #umount $git_server/$proj_name
    #rm $git_server/$proj_name -rf
    mount -t cifs -o username=10132915,domain=zte.intra,password=$password //$pc_ip/proj/001_git/$path_git/$proj_name $git_server/$proj_name
done

for proj_name in ${proj_svn_names[@]}; do
    mkdir $git_server/$proj_name
    #umount $git_server/$proj_name
    #rm $git_server/$proj_name -rf
    mount -t cifs -o username=10132915,domain=zte.intra,password=$password //$pc_ip/proj/001_git/$path_svn/$proj_name $git_server/$proj_name
done
