#!/bin/bash -x

#TAKE USER INPUT
read -p  "Enter Number: " input1
read -p  "Enter Number: " input2
read -p  "Enter Number: " input3

#COMPUTING FIRST EXPRESSTION
result1=`echo "scale=2; $input1 + $input2 * $input3" | bc`

#COMPUTING SECOND EXPRESSTION
result2=`echo "scale=2; $input1 * $input2 + $input3" | bc`

#COMPUTING THIRD EXPRESSTION
result3=`echo "scale=2; $input3 + $input1 / $input2" | bc`

#COMPUTING FOURTH EXPRESSTION
result4=`echo "scale=2; $input1 % $input2 + $input3" | bc`

#DECLARE DICTIONARY
declare -A Dictionary

#STORE COMPUTATION RESULTS IN DICTIONARY
Dictionary[1]=$result1
Dictionary[2]=$result2
Dictionary[3]=$result3
Dictionary[4]=$result4

