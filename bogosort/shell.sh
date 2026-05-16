#!/bin/bash

is_sorted() {
    local arr=("$@")
    local n=${#arr[@]}
    for ((i = 0; i < n - 1; i++)); do
        if ((arr[i] > arr[i + 1])); then
            return 1
        fi
    done
    return 0
}

shuffle() {
    local arr=("$@")
    local n=${#arr[@]}
    for ((i = n - 1; i > 0; i--)); do
        local j=$((RANDOM % (i + 1)))
        local tmp=${arr[i]}
        arr[i]=${arr[j]}
        arr[j]=$tmp
    done
    echo "${arr[@]}"
}

bogosort() {
    local arr=("$@")
    while ! is_sorted "${arr[@]}"; do
        arr=($(shuffle "${arr[@]}"))
    done
    echo "${arr[@]}"
}

arr=(3 1 4 1 5 9 2 6)
result=($(bogosort "${arr[@]}"))
echo "${result[@]}"
