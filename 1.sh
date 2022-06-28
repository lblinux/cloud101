#!/bin/bash

num=$[RANDOM%10-1]
#echo "$num"

while :
do
read -p"1-100选其一:" cai
     if [$cai -eq $num]
    then
        echo "妙啊"
        exit
        elif [ $cai -gt $num ]
        then 
                echo   "OP,大了"
                else
                echo "op,你小了"
    fi
done
