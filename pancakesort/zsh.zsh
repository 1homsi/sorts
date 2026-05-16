#!/usr/bin/env zsh

arr=(3 6 2 7 4 1 5)

flip() {
    local k=$1 left=1 right=$((k+1)) tmp
    while (( left < right )); do
        tmp=${arr[$left]}
        arr[$left]=${arr[$right]}
        arr[$right]=$tmp
        (( left++ ))
        (( right-- ))
    done
}

find_max_idx() {
    local size=$1 max_idx=1
    for (( i=2; i<=size; i++ )); do
        (( arr[i] > arr[max_idx] )) && max_idx=$i
    done
    echo $max_idx
}

n=${#arr[@]}
size=$n
while (( size > 1 )); do
    max_idx=$(find_max_idx $size)
    if (( max_idx != size )); then
        (( max_idx != 1 )) && flip $((max_idx-1))
        flip $((size-1))
    fi
    (( size-- ))
done

print "${arr[@]}"
