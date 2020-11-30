## 一些安装rtlinux的脚本

+ basic_install.sh 用来第一次进入系统安装一些必要的软件，如gcc，make等。
+ start.sh 用来下载linux内核及补丁到指定目录，以供后面的编译操作。
+ install_cyclictest.sh 用来安装cyclictest测试程序
+ cyc.sh 用来多次测试cyclictest然后统计结果，用法 ./cyc n ，结果会保存在result.txt




## 参考链接

1. [CentOS 7 下编译安装 Linux 4.14 内核](https://blog.csdn.net/mrzhouxiaofei/article/details/79140435)
2. [Linux 内核实时补丁PREEMPT_RT 安装](https://blog.csdn.net/zzsfqiuyigui/article/details/7621665)
3. [给linux内核打实时补丁preempt_rt](https://www.jianshu.com/p/8787e45a9e01)
4. [编译内核错误1](https://blog.csdn.net/u010356768/article/details/105805483?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-1.channel_param&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-1.channel_param)
5. [ubuntu打实时内核补丁](https://blog.csdn.net/x356982611/article/details/77370385)
6. [Centos8如何配置网桥](https://blog.csdn.net/mdykj33/article/details/102638382)
7. [Centos7笔记之KVM之使用GUI图形界面安装kvm虚拟机](https://blog.csdn.net/xoofly/article/details/102496447)