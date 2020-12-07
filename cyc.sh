#!/bin/bash


#Run ./cyc n fname logname
#n是测试的次数 fname是结果保存的文件
# ./cyc 10 result.txt log.txt

echo "This is cyclictest"
n=$1
#当$2为null或则空的字符串时 result为result.txt
result=${2:-"result.txt"}
#log_file="latency.log"

log_file=${3:-"log.txt"}

#cyclictest执行的命令
cyc_ins="sudo cyclictest -t1 -p80 -n -i 10000 -l 10000"

#结果的前置信息 -e 的意思是允许转义，默认是不允许的
info="${cyc_ins}\nResults:\n\n"
echo -e $info > $result  
echo -e "" > $log_file   


#初始的变量
max_latency=0
min_latency=9999
total_latency=0
average_latency=0

#保存的原始信息
max_info=""
min_info=""


#检查一条输出是否满足条件，如果满足更换最大最小值
function check(){
    info=$@ #所有参数组合为一个字符串
    cur_latency=${info##*:}  #得到最后的Max
    #是否更改最大值
    if [ $cur_latency -gt $max_latency ] 
    then 
        max_latency=$cur_latency
        max_info=$info
    fi

    #是否更改最小值
    if [ $cur_latency -lt $min_latency ] 
    then 
        min_latency=$cur_latency
        min_info=$info
    fi
    total_latency=`expr $total_latency +  $cur_latency`
}




#n次循环
for i in $(seq 1 $n)
do
    echo "Testing case $i..."   
    
    res=$(${cyc_ins} | tail -n 1)
    echo "$i:${res}" >> $log_file
    check $res

    echo "Test case $i done!"
done

average_latency=`expr $total_latency / $n`

echo "------------------------------------------"
echo "------------------------------------------"
echo "Total test count is $n" | tee -a $result
echo "Max latency is ${max_latency}us"  | tee -a $result
echo "Max result is ${max_info}"      | tee -a $result
echo "Min latency is ${min_latency}us"  | tee -a $result
echo "Min result is ${min_info}"      | tee -a $result
echo "Average latency is ${average_latency}us" | tee -a $result
