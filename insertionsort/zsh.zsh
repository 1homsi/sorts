insertion_sort() {
    local -a arr=("$@")
    local n=${#arr[@]}
    for ((i=1; i<n; i++)); do
        local key=${arr[$i]}
        local j=$((i-1))
        while ((j>=0)) && ((arr[j]>key)); do
            arr[$((j+1))]=${arr[$j]}
            ((j--))
        done
        arr[$((j+1))]=$key
    done
    print -r -- "${arr[@]}"
}
