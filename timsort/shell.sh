#!/bin/bash

MIN_RUN=32

insertion_sort() {
    local -n arr=$1
    local left=$2 right=$3
    local i j key
    for ((i=left+1; i<=right; i++)); do
        key=${arr[i]}
        j=$((i-1))
        while ((j>=left && arr[j]>key)); do
            arr[$((j+1))]=${arr[j]}
            ((j--))
        done
        arr[$((j+1))]=$key
    done
}

merge() {
    local -n arr=$1
    local left=$2 mid=$3 right=$4
    local i j k
    local -a lp rp
    for ((i=left; i<=mid; i++)); do lp+=("${arr[i]}"); done
    for ((i=mid+1; i<=right; i++)); do rp+=("${arr[i]}"); done
    i=0; j=0; k=$left
    while ((i<${#lp[@]} && j<${#rp[@]})); do
        if ((lp[i]<=rp[j])); then
            arr[$k]=${lp[i]}; ((i++))
        else
            arr[$k]=${rp[j]}; ((j++))
        fi
        ((k++))
    done
    while ((i<${#lp[@]})); do arr[$k]=${lp[i]}; ((i++)); ((k++)); done
    while ((j<${#rp[@]})); do arr[$k]=${rp[j]}; ((j++)); ((k++)); done
}

timsort() {
    local -n arr=$1
    local n=${#arr[@]}
    local i=0 size right mid left_idx
    while ((i<n)); do
        right=$((i+MIN_RUN-1))
        ((right>=n)) && right=$((n-1))
        insertion_sort arr $i $right
        ((i+=MIN_RUN))
    done
    size=$MIN_RUN
    while ((size<n)); do
        left_idx=0
        while ((left_idx<n)); do
            mid=$((left_idx+size-1))
            ((mid>=n)) && mid=$((n-1))
            right=$((left_idx+2*size-1))
            ((right>=n)) && right=$((n-1))
            ((mid<right)) && merge arr $left_idx $mid $right
            ((left_idx+=2*size))
        done
        ((size*=2))
    done
}

arr=(5 2 8 1 9 3 7 4 6)
timsort arr
echo "${arr[@]}"
