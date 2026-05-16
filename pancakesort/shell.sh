#!/bin/bash

arr=(3 6 2 7 4 1 5)

flip() {
    local k=$1
    local left=0 right=$k tmp
    while [ $left -lt $right ]; do
        tmp=${arr[$left]}
        arr[$left]=${arr[$right]}
        arr[$right]=$tmp
        ((left++)); ((right--))
    done
}

pancake_sort() {
    local n=${#arr[@]}
    for ((size=n; size>1; size--)); do
        local max_idx=0
        for ((i=1; i<size; i++)); do
            if [ ${arr[$i]} -gt ${arr[$max_idx]} ]; then
                max_idx=$i
            fi
        done
        if [ $max_idx -ne $((size-1)) ]; then
            [ $max_idx -ne 0 ] && flip $max_idx
            flip $((size-1))
        fi
    done
}

pancake_sort
echo "${arr[@]}"
