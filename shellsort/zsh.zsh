#!/usr/bin/env zsh

shell_sort() {
    local -a arr=("$@")
    local n=${#arr[@]}
    local gap=$((n / 2))
    local i j temp
    while (( gap > 0 )); do
        for (( i = gap; i < n; i++ )); do
            temp=${arr[i]}
            j=$i
            while (( j >= gap )) && (( arr[j - gap] > temp )); do
                arr[j]=${arr[j - gap]}
                (( j -= gap ))
            done
            arr[j]=$temp
        done
        (( gap /= 2 ))
    done
    echo "${arr[@]}"
}

shell_sort 64 34 25 12 22 11 90
