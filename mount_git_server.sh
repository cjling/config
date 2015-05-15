#!/bin/bash

#cjling
#proj_name='k-vim'
#proj_name='leetcode'
#proj_name='linux_package'
proj_name='linux_setting'
#proj_name='oh-my-zsh'

#proj
#proj_name='ZXCCP-VPlat_CVM-trunk-source.repo-src-openstack-nova'
#proj_name='ZXCCP-VPlat_CVM-trunk-source.repo-src-python-novaclient'
#proj_name='ZXCCP-VPlat_CVM-trunk-source.repo-src-openstack-cinder'
#proj_name='ZXCCP-VPlat_CVM-trunk-source.repo-src-openstack-neutron'

pc_ip='10.74.30.156'
path='clone_from_git'
#path='clone_from_svn'

mkdir $proj_name
mount -t cifs -o username=10132915,domain=zte.intra //$pc_ip/proj/001_git/$path/$proj_name /home/cjling/006_git_server/$proj_name
