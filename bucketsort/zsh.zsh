#!/bin/zsh

insertion_sort() {
    local -a bucket=("$@")
    local n=${#bucket[@]}
    local key j
    for ((i=1; i<n; i++)); do
        key="${bucket[$i]}"
        j=$((i-1))
        while ((j>=0)) && (( $(echo "$key < ${bucket[$j]}" | bc -l) )); do
            bucket[$((j+1))]="${bucket[$j]}"
            ((j--))
        done
        bucket[$((j+1))]="$key"
    done
    echo "${bucket[@]}"
}

bucket_sort() {
    local -a arr=("$@")
    local n=${#arr[@]}
    ((n==0)) && echo "${arr[@]}" && return
    local min_v=${arr[0]} max_v=${arr[0]}
    for v in "${arr[@]}"; do
        (( $(echo "$v < $min_v" | bc -l) )) && min_v=$v
        (( $(echo "$v > $max_v" | bc -l) )) && max_v=$v
    done
    local -a result=()
    local -A buckets
    for num in "${arr[@]}"; do
        local idx=$(echo "scale=0; ($num - $min_v) / ($max_v - $min_v + 1) * $n / 1" | bc -l)
        ((idx >= n)) && idx=$((n-1))
        buckets[$idx]+=" $num"
    done
    for ((i=0; i<n; i++)); do
        if [[ -n "${buckets[$i]}" ]]; then
            local -a sorted=($(insertion_sort ${buckets[$i]}))
            result+=("${sorted[@]}")
        fi
    done
    echo "${result[@]}"
}

data=(0.78 0.17 0.39 0.26 0.72 0.94 0.21 0.12 0.23 0.68)
echo $(bucket_sort "${data[@]}")
