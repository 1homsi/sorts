selection_sort() {
    local -a arr=("$@")
    local n=${#arr[@]}
    for ((i=1; i<=n; i++)); do
        local min_idx=$i
        for ((j=i+1; j<=n; j++)); do
            (( arr[j] < arr[min_idx] )) && min_idx=$j
        done
        local tmp=${arr[$i]}
        arr[$i]=${arr[$min_idx]}
        arr[$min_idx]=$tmp
    done
    echo "${arr[@]}"
}
