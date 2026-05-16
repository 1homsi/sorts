#!/usr/bin/env zsh

comb_sort() {
    local -a arr=($@)
    local n=${#arr[@]}
    local gap=$n
    local sorted=0

    while (( sorted == 0 )); do
        gap=$(( gap * 10 / 13 ))
        (( gap <= 1 )) && gap=1 && sorted=1
        local changed=0
        for (( i=1; i+gap<=n; i++ )); do
            local j=$(( i + gap ))
            if (( arr[i] > arr[j] )); then
                local tmp=${arr[i]}
                arr[i]=${arr[j]}
                arr[j]=$tmp
                changed=1
                sorted=0
            fi
        done
        (( gap == 1 && changed == 0 )) && sorted=1
    done
    echo "${arr[@]}"
}
