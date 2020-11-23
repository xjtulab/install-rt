#!/bin/bash

echo "hello wolrd"

#创建source目录
dir="source"
if [ ! -d $dir ]
then 
    mkdir $dir
else 
    echo $dir "exist"
fi

#下载内核代码文件和补丁
source_code_url="https://mirrors.tuna.tsinghua.edu.cn/kernel/v4.x/linux-4.18.16.tar.gz"
patch_url="https://mirrors.edge.kernel.org/pub/linux/kernel/projects/rt/4.18/patch-4.18.16-rt9.patch.gz"
source_name="linux-4.18.16.tar.gz"
patch_name="patch-4.18.16-rt9.patch.gz"
patch_name_after="patch-4.18.16-rt9.patch"
source_dir_name="/usr/src/linux-4.18.16/"

cd source 
wget $source_code_url
wget $patch_url
echo "Download done!!"

#解压
sudo tar -xzvf $source_name -C /usr/src/
gunzip $patch_name
sudo cp $patch_name_after $source_dir_name

#打patch
cd $source_dir_name
sudo patch -p1 < $patch_name_after


