#!/usr/bin/env zsh

cocktail_sort() {
    local -a arr=("$@")
    local n=${#arr[@]}
    local swapped=1 start=0 end=$((n-1)) tmp i

    while (( swapped )); do
        swapped=0
        for (( i=start; i<end; i++ )); do
            if (( arr[i+1] > arr[i+2] )); then
                tmp=${arr[i+1]}
                arr[i+1]=${arr[i+2]}
                arr[i+2]=$tmp
                swapped=1
            fi
        done
        (( !swapped )) && break
        swapped=0
        (( end-- ))
        for (( i=end-1; i>=start; i-- )); do
            if (( arr[i+1] > arr[i+2] )); then
                tmp=${arr[i+1]}
                arr[i+1]=${arr[i+2]}
                arr[i+2]=$tmp
                swapped=1
            fi
        done
        (( start++ ))
    done
    echo "${arr[@]}"
}
