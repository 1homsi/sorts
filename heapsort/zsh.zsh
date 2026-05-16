#!/bin/zsh

typeset -a arr=(12 11 13 5 6 7)

heapify() {
    local n=$1 i=$2
    local largest=$i
    local left=$((2 * i + 1))
    local right=$((2 * i + 2))
    [[ $left -lt $n && ${arr[$((left+1))]} -gt ${arr[$((largest+1))]} ]] && largest=$left
    [[ $right -lt $n && ${arr[$((right+1))]} -gt ${arr[$((largest+1))]} ]] && largest=$right
    if [[ $largest -ne $i ]]; then
        local tmp=${arr[$((i+1))]}
        arr[$((i+1))]=${arr[$((largest+1))]}
        arr[$((largest+1))]=$tmp
        heapify $n $largest
    fi
}

heapsort() {
    local n=${#arr[@]}
    for ((i = n/2 - 1; i >= 0; i--)); do heapify $n $i; done
    for ((i = n - 1; i > 0; i--)); do
        local tmp=${arr[1]}; arr[1]=${arr[$((i+1))]}; arr[$((i+1))]=$tmp
        heapify $i 0
    done
}

heapsort
print -l ${arr[@]}
