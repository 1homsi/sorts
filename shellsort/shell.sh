#!/bin/bash

shell_sort() {
    local arr=("$@")
    local n=${#arr[@]}
    local gap=$((n / 2))
    while [ $gap -gt 0 ]; do
        for ((i = gap; i < n; i++)); do
            local temp=${arr[$i]}
            local j=$i
            while [ $j -ge $gap ] && [ ${arr[$((j - gap))]} -gt $temp ]; do
                arr[$j]=${arr[$((j - gap))]}
                j=$((j - gap))
            done
            arr[$j]=$temp
        done
        gap=$((gap / 2))
    done
    echo "${arr[@]}"
}

arr=(64 34 25 12 22 11 90)
shell_sort "${arr[@]}"
