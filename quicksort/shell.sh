#!/bin/bash

quicksort() {
    local arr=("$@")
    local n=${#arr[@]}
    if [ $n -le 1 ]; then
        echo "${arr[@]}"
        return
    fi
    local pivot=${arr[$((n / 2))]}
    local left=() middle=() right=()
    for x in "${arr[@]}"; do
        if [ "$x" -lt "$pivot" ]; then left+=("$x")
        elif [ "$x" -eq "$pivot" ]; then middle+=("$x")
        else right+=("$x")
        fi
    done
    local sl sm sr
    sl=$(quicksort "${left[@]}")
    sr=$(quicksort "${right[@]}")
    echo $sl ${middle[@]} $sr
}

result=$(quicksort 3 6 8 10 1 2 1)
echo $result
