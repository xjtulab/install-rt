#!/bin/bash

#这个文件用来安装cyclitest
url="git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git"
git clone $url
cd rt-tests

#创建一个新的分支testing然后切换到分支
git branch testing
git checkout testing

#编译安装 
make 
sudo cp cyclictest /bin/

echo "Install cyclictest done!"

