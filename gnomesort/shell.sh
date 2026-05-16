#!/bin/bash
gnome_sort() {
    local arr=("$@")
    local n=${#arr[@]}
    local i=0
    while [ $i -lt $n ]; do
        if [ $i -eq 0 ] || [ ${arr[$i]} -ge ${arr[$((i-1))]} ]; then
            ((i++))
        else
            local tmp=${arr[$i]}
            arr[$i]=${arr[$((i-1))]}
            arr[$((i-1))]=$tmp
            ((i--))
        fi
    done
    echo "${arr[@]}"
}
