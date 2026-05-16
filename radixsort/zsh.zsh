#!/usr/bin/env zsh

counting_sort() {
    local -a arr=("${@[1,-2]}")
    local exp=${@[-1]}
    local n=${#arr}
    local -a count output
    for i in {0..9}; do count[$i]=0; done
    for x in "${arr[@]}"; do
        local idx=$(( (x / exp) % 10 ))
        (( count[$idx]++ ))
    done
    for i in {1..9}; do (( count[$i] += count[$((i-1))] )); done
    for i in {0..$(( n-1 ))}; do output[$i]=0; done
    for (( i=n-1; i>=0; i-- )); do
        local x=${arr[$i]}
        local idx=$(( (x / exp) % 10 ))
        (( count[$idx]-- ))
        output[${count[$idx]}]=$x
    done
    echo "${output[@]}"
}

radix_sort() {
    local -a arr=("$@")
    local max=${arr[0]}
    for x in "${arr[@]}"; do [[ $x -gt $max ]] && max=$x; done
    local exp=1
    while (( max / exp > 0 )); do
        arr=($(counting_sort "${arr[@]}" $exp))
        (( exp *= 10 ))
    done
    echo "${arr[@]}"
}

radix_sort 170 45 75 90 802 24 2 66
