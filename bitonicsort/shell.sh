#!/bin/bash

declare -a arr=(3 7 4 8 6 2 1 5)

compare_and_swap() {
    local i=$1 j=$2 dir=$3
    local ai=${arr[$i]} aj=${arr[$j]}
    if [ $dir -eq 1 ] && [ $ai -gt $aj ]; then
        arr[$i]=$aj; arr[$j]=$ai
    elif [ $dir -eq 0 ] && [ $ai -lt $aj ]; then
        arr[$i]=$aj; arr[$j]=$ai
    fi
}

bitonic_merge() {
    local lo=$1 cnt=$2 dir=$3
    if [ $cnt -gt 1 ]; then
        local k=$((cnt / 2))
        for ((i=lo; i<lo+k; i++)); do
            compare_and_swap $i $((i+k)) $dir
        done
        bitonic_merge $lo $k $dir
        bitonic_merge $((lo+k)) $k $dir
    fi
}

bitonic_sort() {
    local lo=$1 cnt=$2 dir=$3
    if [ $cnt -gt 1 ]; then
        local k=$((cnt / 2))
        bitonic_sort $lo $k 1
        bitonic_sort $((lo+k)) $k 0
        bitonic_merge $lo $cnt $dir
    fi
}

bitonic_sort 0 ${#arr[@]} 1
echo "${arr[@]}"
