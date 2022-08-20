

#! /bin/bash

# Dinamic input for N
echo "How many number of terms to be generated ?"
read n

# First Number of the
# Fibonacci Series
#a=0
echo "Enter the first value of series"
read a
# Second Number of the
# Fibonacci Series
#b=1
echo "Enter the second value of series"
read b 

count=2
echo "Fibonacci series:"
echo $a
echo $b
while [ $count -lt $n ]
do
fib=`expr $a + $b`
a=$b 
b=$fib
echo $fib
count=`expr $count + 1`
done


# End of for loop

# Program for Fibonacci
# Series