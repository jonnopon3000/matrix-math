#!/bin/sh

#####################
## READ MATRIX SIZE
#####################
read -p "How many rows does matrix 1 have? : " r1
read -p "How many columns does matrix 1 have? : " c1
#enforce the rule: matrix of MxN can only be multiplied by matrix of NxP
let r2=$c1
read -p "How many columns does matrix 2 have? : " c2 && echo ""

if [ $r1 -le 0 ] || [ $c1 -le 0 ] || [ $r2 -le 0 ] || [ $c2 -le 0 ]; then
	echo "BAD VALUES SUPPLIED - Matrices cannot be of order 0 or less!"
	exit 0
fi

#################
## READ MATRIX 1
#################
for i in `seq 0 $(($r1-1))`
do
	for j in `seq 0 $(($c1-1))`
	do
		read -p "Enter row $(($i+1)), col $(($j+1)) for matrix 1 : " m1[$(($c1*$i+$j))]
	done
done

#################
## READ MATRIX 2
#################
echo ""
for i in `seq 0 $(($r2-1))`
do
	for j in `seq 0 $(($c2-1))`
	do
		read -p "Enter row $(($i+1)), col $(($j+1)) for matrix 2 : " m2[$(($c2*$i+$j))]
	done
done

######################
## MULTIPLY AND PRINT
######################
s=0
for i in `seq 0 $(($r1-1))`
do
	for j in `seq 0 $(($c2-1))`
	do
		for k in `seq 0 $(($r2-1))`
		do
			s=$((s+${m1[$((c1*i+k))]}*${m2[$((c2*k+j))]}))
		done
		mult[$(($r1*$i+$j))]=$s
		s=0
	done
done

echo "Matrix after multiplication is"
for i in `seq 0 $(($r1-1))` 
do 
	for j in `seq 0 $(($c2-1))` 
	do 
    	echo -ne "${mult[$(($c2*$i+$j))]}\t" 
	done 
	echo -e "\n" 
done

$SHELL