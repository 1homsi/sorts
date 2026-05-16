#!/bin/bash

bubble_sort() {
    local arr=("$@")
    local n=${#arr[@]}
    local swapped
    while true; do
        swapped=0
        for ((i = 0; i < n - 1; i++)); do
            if ((arr[i] > arr[i + 1])); then
                local tmp=${arr[i]}
                arr[i]=${arr[i + 1]}
                arr[i + 1]=$tmp
                swapped=1
            fi
        done
        ((n--))
        if ((swapped == 0)); then
            break
        fi
    done
    echo "${arr[@]}"
}

arr=(64 34 25 12 22 11 90)
result=$(bubble_sort "${arr[@]}")
echo "$result"
