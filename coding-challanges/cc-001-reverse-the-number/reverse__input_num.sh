#!/bin/bash
echo "enter your number:"
read your_number
rev_num=0
inital_num=$your_number 
while [ $your_number -gt 0 ]
do
num=$(expr $your_number % 10)
rev_num=$(expr $rev_num \* 10 + $num)
your_number=$(expr $your_number / 10)
done
echo "Reverser number of $inital_num is $rev_num"

