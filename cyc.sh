#!/bin/bash


#Run ./cyc n fname
#n是测试的次数 fname是结果保存的文件
# ./cyc 10 result.txt

echo "This is cyclictest"
n=$1
result=$2

#cyclictest执行的命令
cyc_ins="sudo cyclictest -t1 -p80 -n -i 10000 -l 100"

#结果的前置信息
info="${cyc_ins}\nResults:\n\n"
echo -e $info > $result   

#n次循环
for i in $(seq 1 $n)
do
    echo "Testing case $i..."
    echo -n "$i: " >> $result
    $cyc_ins | tail -n 1 >> $result
    echo "Test case $i done!"
done
cyc_ins="sudo cyclictest -t1 -p80 -n -i 10000 -l 100"
#$cyc_ins | tail -n 1 > test.txt