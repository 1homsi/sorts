selection_sort() {
    local arr=("$@")
    local n=${#arr[@]}
    for ((i = 0; i < n; i++)); do
        local min_idx=$i
        for ((j = i + 1; j < n; j++)); do
            if (( arr[j] < arr[min_idx] )); then
                min_idx=$j
            fi
        done
        local tmp=${arr[$i]}
        arr[$i]=${arr[$min_idx]}
        arr[$min_idx]=$tmp
    done
    echo "${arr[@]}"
}
