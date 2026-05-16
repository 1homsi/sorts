#!/bin/bash

comb_sort() {
    local arr=("$@")
    local n=${#arr[@]}
    local gap=$n
    local sorted=0

    while [ $sorted -eq 0 ]; do
        gap=$(echo "scale=0; $gap / 1.3 / 1" | bc)
        [ $gap -le 1 ] && gap=1 && sorted=1
        local changed=0
        for ((i=0; i+gap<n; i++)); do
            if [ ${arr[$i]} -gt ${arr[$((i+gap))]} ]; then
                tmp=${arr[$i]}
                arr[$i]=${arr[$((i+gap))]}
                arr[$((i+gap))]=$tmp
                changed=1
                sorted=0
            fi
        done
        [ $gap -eq 1 ] && [ $changed -eq 0 ] && sorted=1
    done
    echo "${arr[@]}"
}
