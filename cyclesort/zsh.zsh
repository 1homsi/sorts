#!/usr/bin/env zsh

cycle_sort() {
    local -a arr=($@)
    local n=${#arr}
    local writes=0

    for ((cycle_start=1; cycle_start<=n-1; cycle_start++)); do
        local item=${arr[$cycle_start]}
        local pos=$cycle_start
        for ((i=cycle_start+1; i<=n; i++)); do
            (( arr[i] < item )) && ((pos++))
        done
        (( pos == cycle_start )) && continue
        while (( arr[pos] == item )); do ((pos++)); done
        local tmp=${arr[$pos]}
        arr[$pos]=$item
        item=$tmp
        ((writes++))
        while (( pos != cycle_start )); do
            pos=$cycle_start
            for ((i=cycle_start+1; i<=n; i++)); do
                (( arr[i] < item )) && ((pos++))
            done
            while (( arr[pos] == item )); do ((pos++)); done
            tmp=${arr[$pos]}
            arr[$pos]=$item
            item=$tmp
            ((writes++))
        done
    done
    echo ${arr[@]}
}

cycle_sort 5 4 3 2 1
