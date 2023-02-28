#!/bin/bash

#7.0
bubblesort()
{
tablica=( "$@" )
dlugosc="${#tablica[@]}"

flag=1
for (( i=0; i < dlugosc-1 && flag==1 ; i++ ))
do
    flag=0
    for (( j=0; j<dlugosc-i-1; j++ ))
    do
        if (( ${tablica[$j]} > ${tablica[$j+1]} )); then
            temp=${tablica[$j]}
            tablica[$j]=${tablica[$j+1]}
            tablica[$j+1]=$temp
            flag=1
        fi
    done
done

for (( l=0; l<dlugosc; l++))
do
    echo -ne "${tablica[$l]} \n"
done
}



#7.1

twodtab()
{
if (( $1 <= 0 && $2 <= 0 )); then
echo "podaj dwie dodatnie liczby"
   exit
else
 declare -A asArray2
 num_rows=$(( $1 + 0 ))
 num_columns=$(( $2 + 0 ))
 for (( i=1;i<=num_rows;i++ )) do
   for (( j=1;j<=num_columns;j++ )) do
     asArray2[$i,$j]=$(($i * $j))
    done
 done
 
 
f1="%$((${#num_rows}+1))s"
f2=" %9s"

printf "$f1" ''
for ((i=1;i<=num_rows;i++)) do
    printf "$f2" $i
done
echo

for ((j=1;j<=num_columns;j++)) do
    printf "$f1" $j
    for ((i=1;i<=num_rows;i++)) do
        printf "$f2" ${asArray2[$i,$j]}
    done
    echo
done
fi
}
    


calka()
{
declare -a tablicalka
tablicalka=($@)
calka=0

  for (( i=0;i<$#-1;i++ )); do
    a=${tablicalka[i]}
    b=${tablicalka[i+1]}
    suma=$a+$b
    c=($suma)/2
    calka=$calka+$c
  done
echo $calka | bc -l
} 
#bubblesort $@
#twodtab $1 $2
calka $@
