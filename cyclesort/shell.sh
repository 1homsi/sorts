#!/bin/bash

cycle_sort() {
    local -n arr=$1
    local n=${#arr[@]}
    local writes=0
    for ((cycle_start=0; cycle_start<n-1; cycle_start++)); do
        local item=${arr[$cycle_start]}
        local pos=$cycle_start
        for ((i=cycle_start+1; i<n; i++)); do
            if (( arr[i] < item )); then ((pos++)); fi
        done
        if (( pos == cycle_start )); then continue; fi
        while (( item == arr[pos] )); do ((pos++)); done
        local tmp=${arr[$pos]}
        arr[$pos]=$item
        item=$tmp
        ((writes++))
        while (( pos != cycle_start )); do
            pos=$cycle_start
            for ((i=cycle_start+1; i<n; i++)); do
                if (( arr[i] < item )); then ((pos++)); fi
            done
            while (( item == arr[pos] )); do ((pos++)); done
            tmp=${arr[$pos]}
            arr[$pos]=$item
            item=$tmp
            ((writes++))
        done
    done
}

arr=(5 4 3 2 1)
cycle_sort arr
echo "${arr[@]}"
