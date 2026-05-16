#!/bin/bash

radix_sort() {
    local -a arr=("$@")
    local n=${#arr[@]}
    if [ $n -eq 0 ]; then echo ""; return; fi
    local max=${arr[0]}
    for x in "${arr[@]}"; do [ $x -gt $max ] && max=$x; done
    local exp=1
    while [ $((max / exp)) -gt 0 ]; do
        local -a count=()
        for i in $(seq 0 9); do count[$i]=0; done
        for x in "${arr[@]}"; do
            local idx=$(( (x / exp) % 10 ))
            count[$idx]=$((count[$idx] + 1))
        done
        for i in $(seq 1 9); do count[$i]=$((count[$i] + count[$i-1])); done
        local -a output=()
        for i in $(seq 0 $((n-1))); do output[$i]=0; done
        for i in $(seq $((n-1)) -1 0); do
            local x=${arr[$i]}
            local idx=$(( (x / exp) % 10 ))
            count[$idx]=$((count[$idx] - 1))
            output[${count[$idx]}]=$x
        done
        arr=("${output[@]}")
        exp=$((exp * 10))
    done
    echo "${arr[@]}"
}

result=$(radix_sort 170 45 75 90 802 24 2 66)
echo "$result"
