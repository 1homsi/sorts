#!/usr/bin/env zsh

quicksort() {
    local -a arr=($@)
    local n=${#arr}
    if (( n <= 1 )); then
        echo "${arr[@]}"
        return
    fi
    local pivot=${arr[$((n / 2 + 1))]}
    local -a left=() middle=() right=()
    for x in "${arr[@]}"; do
        if (( x < pivot )); then left+=($x)
        elif (( x == pivot )); then middle+=($x)
        else right+=($x)
        fi
    done
    local sl sm sr
    [[ ${#left} -gt 0 ]] && sl=$(quicksort ${left[@]})
    [[ ${#right} -gt 0 ]] && sr=$(quicksort ${right[@]})
    echo $sl ${middle[@]} $sr
}

quicksort 3 6 8 10 1 2 1
