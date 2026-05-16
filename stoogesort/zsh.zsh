#!/bin/zsh

typeset -a arr=(3 1 4 1 5 9 2 6)

stooge_sort() {
    local first=$1 last=$2
    if (( arr[first+1] > arr[last+1] )); then
        local tmp=${arr[first+1]}
        arr[first+1]=${arr[last+1]}
        arr[last+1]=$tmp
    fi
    local n=$(( last - first + 1 ))
    if (( n > 2 )); then
        local t=$(( n * 2 / 3 ))
        stooge_sort $first $(( first + t - 1 ))
        stooge_sort $(( last - t + 1 )) $last
        stooge_sort $first $(( first + t - 1 ))
    fi
}

stooge_sort 0 $(( ${#arr} - 1 ))
echo "${arr[@]}"
