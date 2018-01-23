#!/bin/bash

function burbujeo() {
    declare -a -i localVector=("${!1}")
    
    for((i = 0; i < SIZE - 1; i++)) {
        for((j = i + 1; j < SIZE; j++)) { 
            if((localVector[i] > localVector[j]))
            then 
                declare -i auxiliary=${localVector[i]}
                localVector[$i]=${localVector[j]}
                localVector[$j]=$auxiliary
            fi	
        }
    }

    echo ${localVector[@]}
    
}

declare -i SIZE=1000
declare -i -a vector

for((i=0; i< SIZE; i++)) {
    vector[$i]=$(((RANDOM % SIZE) + 1))
}

SECONDS=0

vector=($(burbujeo vector[@]))

for((i=0; i< SIZE; i++)) {
    echo ${vector[i]}
}

TIEMPO=$SECONDS

echo "Demoramos $TIEMPO segundos"

exit 0
