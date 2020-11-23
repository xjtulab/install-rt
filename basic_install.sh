#!/bin/bash

echo "hello wolrd"

#第一次进入系统需要装一些包
packages=(make gcc flex bison ncurses-devel elfutils-libelf-devel openssl-devel)
for pkg in ${packages[@]}
do 
    echo "Prepare to install " $pkg
    sudo yum install $pkg
done
