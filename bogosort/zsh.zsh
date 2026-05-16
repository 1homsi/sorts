#!/bin/zsh

is_sorted() {
    local -a arr=("$@")
    local n=${#arr[@]}
    for ((i=1; i<n; i++)); do
        if ((arr[i] > arr[i+1])); then
            return 1
        fi
    done
    return 0
}

shuffle() {
    local -a arr=("$@")
    local n=${#arr[@]}
    for ((i=n; i>1; i--)); do
        local j=$(( RANDOM % i + 1 ))
        local tmp=${arr[i]}
        arr[i]=${arr[j]}
        arr[j]=$tmp
    done
    print -r -- "${arr[@]}"
}

bogosort() {
    local -a arr=("$@")
    until is_sorted "${arr[@]}"; do
        arr=($(shuffle "${arr[@]}"))
    done
    print -r -- "${arr[@]}"
}

arr=(3 1 4 1 5 9 2 6)
bogosort "${arr[@]}"
