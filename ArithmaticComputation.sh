#!/bin/bash -x

#TAKE USER INPUT
read -p  "Enter Number: " input1
read -p  "Enter Number: " input2
read -p  "Enter Number: " input3

#COMPUTING FIRST EXPRESSTION
result1=`echo "scale=2; $input1 + $input2 * $input3" | bc`
