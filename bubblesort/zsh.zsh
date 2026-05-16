#!/usr/bin/env zsh

bubble_sort() {
    local -a arr=("$@")
    local n=${#arr} swapped tmp
    while true; do
        swapped=0
        for ((i=1; i<n; i++)); do
            j=$((i+1))
            if ((arr[i] > arr[j])); then
                tmp=${arr[i]}
                arr[i]=${arr[j]}
                arr[j]=$tmp
                swapped=1
            fi
        done
        ((n--))
        ((swapped == 0)) && break
    done
    print "${arr[@]}"
}

bubble_sort 64 34 25 12 22 11 90
