#!/bin/zsh

merge() {
    local -a left=("${@[1,(($1))]}")
    local -a right=("${@[(($1+1)),-1]}")
    local -a result
    local i=1 j=1
    while (( i <= ${#left} && j <= ${#right} )); do
        if (( left[i] <= right[j] )); then
            result+=("${left[i++]}")
        else
            result+=("${right[j++]}")
        fi
    done
    while (( i <= ${#left} )); do result+=("${left[i++]}"); done
    while (( j <= ${#right} )); do result+=("${right[j++]}"); done
    print "${result[@]}"
}

merge_sort() {
    local -a arr=("$@")
    local n=${#arr}
    if (( n <= 1 )); then print "${arr[@]}"; return; fi
    local mid=$(( n / 2 ))
    local -a left right
    left=($(merge_sort "${arr[@]:0:$mid}"))
    right=($(merge_sort "${arr[@]:$mid}"))
    local llen=${#left}
    merge $llen "${left[@]}" "${right[@]}"
}

arr=(38 27 43 3 9 82 10)
merge_sort "${arr[@]}"
