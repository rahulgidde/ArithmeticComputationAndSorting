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
declare -A results

#STORE COMPUTATION RESULTS IN DICTIONARY
results[$((index++))]=$result1
results[$((index++))]=$result2
results[$((index++))]=$result3
results[$((index++))]=$result4

#STORE DICTIONARY VALUES INTO ARRAY
for (( index1=0; index1<=${#results[@]}; index1++ ))
do
	sortingResults[$index1]=${results[$index1]}
done

#SORTING THE COMPUTATION RESULT IN DECENDING ORDER
for (( index=0; index<${#sortingResults[@]}; index++ ))
do
	for (( index1=$index+1; index1<${#sortingResults[@]}; index1++ ))
	do
		if (( $(echo "${sortingResults[index]} < ${sortingResults[index1]}" | bc -l) ))
		then
			temp=${sortingResults[index]}
			sortingResults[index]=${sortingResults[index1]}
			sortingResults[index1]=$temp
		fi
	done
done

#SORTING THE COMPUTATION RESULT IN ASCENDING ORDER
for (( index=0; index<${#sortingResults[@]}; index++ ))
do
	for (( index1=$index+1; index1<${#sortingResults[@]}; index1++ ))
	do
		if (( $(echo "${sortingResults[index]} > ${sortingResults[index1]}" | bc -l) ))
		then
			temp=${sortingResults[index]}
			sortingResults[index]=${sortingResults[index1]}
			sortingResults[index1]=$temp
		fi
	done
done

#PRINT ARRAY VALUES
echo ${sortingResults[@]}
