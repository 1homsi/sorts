gnome_sort() {
    local -a arr=("$@")
    local n=${#arr[@]}
    local i=1
    while (( i <= n )); do
        if (( i == 1 || arr[i] >= arr[i-1] )); then
            (( i++ ))
        else
            local tmp=${arr[i]}
            arr[i]=${arr[i-1]}
            arr[i-1]=$tmp
            (( i-- ))
        fi
    done
    echo "${arr[@]}"
}
