#!/bin/bash

bogosort() {
    local -a arr=("$@")
    while ! is_sorted "${arr[@]}"; do
        for ((i = ${#arr[@]} - 1; i > 0; i--)); do
            j=$((RANDOM % (i + 1)))
            local tmp=${arr[i]}
            arr[i]=${arr[j]}
            arr[j]=$tmp
        done
    done
    echo "${arr[@]}"
}

is_sorted() {
    for ((i = 0; i < $# - 1; i++)); do
        if (( ${!((i+1))} < ${!i} )); then
            return 1
        fi
    done
    return 0
}
