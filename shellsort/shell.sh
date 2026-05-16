shellsort() {
    local arr=("$@")
    local n=${#arr[@]}
    local gap=$((n / 2))
    while ((gap > 0)); do
        for ((i = gap; i < n; i++)); do
            local temp=${arr[$i]}
            local j=$i
            while ((j >= gap && arr[j - gap] > temp)); do
                arr[$j]=${arr[$j - gap]}
                ((j -= gap))
            done
            arr[$j]=$temp
        done
        ((gap /= 2))
    done
    echo "${arr[@]}"
}
