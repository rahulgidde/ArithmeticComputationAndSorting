#!/bin/bash -x

#TAKE USER INPUT
read -p  "Enter Number: " input1
read -p  "Enter Number: " input2
read -p  "Enter Number: " input3

#VARIABLE
index=0

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
Dictionary[$((index++))]=$result1
Dictionary[$((index++))]=$result2
Dictionary[$((index++))]=$result3
Dictionary[$((index++))]=$result4

#STORE DICTIONARY VALUES INTO ARRAY
for (( index1=0; index1<=${#Dictionary[@]}; index1++ ))
do
	Array[$index1]=${Dictionary[$index1]}
done

#SORTING THE COMPUTATION RESULT IN DECENDING ORDER
for (( index=0; index<${#Array[@]}; index++ ))
do
	for (( index1=$index+1; index1<${#Array[@]}; index1++ ))
	do
		if (( $(echo "${Array[index]} < ${Array[index1]}" |bc -l) ))
		then
			temp=${Array[index]}
			Array[index]=${Array[index1]}
			Array[index1]=$temp
		fi
	done
done

