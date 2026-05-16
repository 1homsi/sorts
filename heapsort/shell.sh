#!/bin/bash

declare -a arr=(12 11 13 5 6 7)

heapify() {
    local n=$1 i=$2
    local largest=$i
    local left=$((2 * i + 1))
    local right=$((2 * i + 2))
    [[ $left -lt $n && ${arr[$left]} -gt ${arr[$largest]} ]] && largest=$left
    [[ $right -lt $n && ${arr[$right]} -gt ${arr[$largest]} ]] && largest=$right
    if [[ $largest -ne $i ]]; then
        local tmp=${arr[$i]}; arr[$i]=${arr[$largest]}; arr[$largest]=$tmp
        heapify $n $largest
    fi
}

heapsort() {
    local n=${#arr[@]}
    for ((i = n/2 - 1; i >= 0; i--)); do heapify $n $i; done
    for ((i = n - 1; i > 0; i--)); do
        local tmp=${arr[0]}; arr[0]=${arr[$i]}; arr[$i]=$tmp
        heapify $i 0
    done
}

heapsort
echo "${arr[@]}"
