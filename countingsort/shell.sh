#!/bin/bash
counting_sort() {
    local -a arr=("$@")
    local n=${#arr[@]}
    [ $n -eq 0 ] && return
    local min=${arr[0]} max=${arr[0]}
    for v in "${arr[@]}"; do
        [ $v -lt $min ] && min=$v
        [ $v -gt $max ] && max=$v
    done
    local range=$(( max - min + 1 ))
    local -a count
    for (( i=0; i<range; i++ )); do count[$i]=0; done
    for v in "${arr[@]}"; do (( count[v - min]++ )); done
    for (( i=1; i<range; i++ )); do (( count[i] += count[i-1] )); done
    local -a output
    for (( i=n-1; i>=0; i-- )); do
        local idx=$(( arr[i] - min ))
        (( count[idx]-- ))
        output[${count[$idx]}]=${arr[$i]}
    done
    echo "${output[@]}"
}

counting_sort 4 2 2 8 3 3 1
