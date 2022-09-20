
#!/bin/sh

argCount=$#
# $# : Bu değişken, komut dosyasına sağlanan bağımsız değişkenlerin sayısını içerir.

if [ "$argCount" -lt 2 ]; then

echo "Please enter 2 arguments on command line"

exit 1

fi

input1=$1

input2=$2

sum=`expr $input1 + $input2`
#sum=$(($input1 + $input2))
echo "The sum of $input1 and $input2 is $sum"

exit 0  


 # $? : The exit status of the last command executed. Most commands return 0 if they were successful and 1 if they were unsuccessful.


 # Exit code 0: Success
 # Exit code 1: General errors, Miscellaneous errors, such as "divide by zero" and other impermissible operations
 # Exit code 2: Misuse of shell builtins (according to Bash documentation) 