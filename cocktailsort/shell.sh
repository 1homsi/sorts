#!/bin/bash
cocktail_sort() {
    local -n arr=$1
    local n=${#arr[@]}
    local swapped=1
    local start=0
    local end=$((n - 1))
    while [ $swapped -eq 1 ]; do
        swapped=0
        for ((i = start; i < end; i++)); do
            if [ ${arr[$i]} -gt ${arr[$((i + 1))]} ]; then
                tmp=${arr[$i]}
                arr[$i]=${arr[$((i + 1))]}
                arr[$((i + 1))]=$tmp
                swapped=1
            fi
        done
        [ $swapped -eq 0 ] && break
        swapped=0
        ((end--))
        for ((i = end - 1; i >= start; i--)); do
            if [ ${arr[$i]} -gt ${arr[$((i + 1))]} ]; then
                tmp=${arr[$i]}
                arr[$i]=${arr[$((i + 1))]}
                arr[$((i + 1))]=$tmp
                swapped=1
            fi
        done
        ((start++))
    done
}
