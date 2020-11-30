#!/bin/bash


#Run ./cyc n fname
#n是测试的次数 fname是结果保存的文件
# ./cyc 10 result.txt

outer="out"
max_latency=0
min_latency=10000
total_latency=0

function fun(){
    info=$@
    cur_latency=${info##*:}
    if [ $cur_latency -gt $max_latency ] 
    then 
        max_latency=$cur_latency
    fi

    if [ $cur_latency -lt $min_latency ] 
    then 
        min_latency=$cur_latency
    fi

    total_latency=`expr $total_latency +  $cur_latency`
    echo "Current latency is ${cur_latency}"

}

info1="T: 0 (22256) P:80 I:10000 C:    100 Min:      1 Act:    1 Avg:    1 Max:       10"
info2="T: 0 (22256) P:80 I:10000 C:    100 Min:      1 Act:    1 Avg:    1 Max:       5"
info3="T: 0 (22256) P:80 I:10000 C:    100 Min:      1 Act:    1 Avg:    1 Max:       15"

fun $info1
fun $info2
fun $info3

average_latency=`expr $total_latency / 3`

echo "Max latency is ${max_latency}"
echo "Min latency is ${min_latency}"
echo "Total latency is ${total_latency}"
echo "Average latency is ${average_latency}"