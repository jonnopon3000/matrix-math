#!/bin/sh

#####################
## READ MATRIX SIZE
#####################
read -p "How many rows do the matrices have? : " r
read -p "How many columns do the matrices have? : " c && echo ""

if [ $r -le 0 ] || [ $c -le 0 ]; then
	echo "BAD VALUES SUPPLIED - Matrices cannot be of order 0 or less!"
	exit 0
fi

#################
## READ MATRIX 1
#################
for i in `seq 0 $(($r-1))`
do
	for j in `seq 0 $(($c-1))`
	do
		read -p "Enter row $(($i+1)), col $(($j+1)) for matrix 1 : " m1[$(($c*$i+$j))]
	done
done

#################
## READ MATRIX 2
#################
echo ""
for i in `seq 0 $(($r-1))`
do
	for j in `seq 0 $(($c-1))`
	do
		read -p "Enter row $(($i+1)), col $(($j+1)) for matrix 2 : " m2[$(($c*$i+$j))]
	done
done

################
## ADD AND PRINT
################
for i in `seq 0 $(($r-1))`
do
	for j in `seq 0 $(($c-1))`
	do
		mult[$(($c*$i+$j))]=$((${m1[$(($c*i+j))]}+${m2[$(($c*$i+$j))]}))
	done
done

echo "Matrix after addition is"  
for i in `seq 0 $(($r-1))` 
do 
	for j in `seq 0 $(($c-1))` 
	do 
    	echo -ne "${mult[$(($c*$i+$j))]}\t" 
	done 
	echo -e "\n" 
done

$SHELL