#!/bin/bash

insertion_sort() {
    local arr=("$@")
    local n=${#arr[@]}
    for ((i=1; i<n; i++)); do
        local key="${arr[$i]}"
        local j=$((i-1))
        while ((j>=0)) && (( $(echo "${arr[$j]} > $key" | bc -l) )); do
            arr[$((j+1))]="${arr[$j]}"
            ((j--))
        done
        arr[$((j+1))]="$key"
    done
    echo "${arr[@]}"
}

bucket_sort() {
    local arr=("$@")
    local n=${#arr[@]}
    if ((n==0)); then echo ""; return; fi
    local min="${arr[0]}" max="${arr[0]}"
    for v in "${arr[@]}"; do
        (( $(echo "$v < $min" | bc -l) )) && min="$v"
        (( $(echo "$v > $max" | bc -l) )) && max="$v"
    done
    declare -A buckets
    for num in "${arr[@]}"; do
        local idx=$(echo "scale=0; ($num - $min) / ($max - $min + 1) * $n / 1" | bc -l)
        ((idx >= n)) && idx=$((n-1))
        buckets[$idx]+=" $num"
    done
    local result=()
    for ((i=0; i<n; i++)); do
        if [[ -n "${buckets[$i]}" ]]; then
            local sorted=($(insertion_sort ${buckets[$i]}))
            result+=("${sorted[@]}")
        fi
    done
    echo "${result[@]}"
}

data=(0.78 0.17 0.39 0.26 0.72 0.94 0.21 0.12 0.23 0.68)
echo $(bucket_sort "${data[@]}")
