MIN_RUN=32
arr=(5 2 8 1 9 3 7 4 6)

insertion_sort() {
    local left=$1 right=$2
    local i=$((left+1))
    while (( i <= right )); do
        local key=${arr[$i]}
        local j=$((i-1))
        while (( j >= left && arr[j] > key )); do
            arr[$((j+1))]=${arr[$j]}
            (( j-- ))
        done
        arr[$((j+1))]=$key
        (( i++ ))
    done
}

merge() {
    local left=$1 mid=$2 right=$3
    local lp=() rp=()
    local i
    for (( i=left; i<=mid; i++ )); do lp+=( ${arr[$i]} ); done
    for (( i=mid+1; i<=right; i++ )); do rp+=( ${arr[$i]} ); done
    local li=1 ri=1 k=$left
    local ln=${#lp[@]} rn=${#rp[@]}
    while (( li <= ln && ri <= rn )); do
        if (( lp[li] <= rp[ri] )); then
            arr[$k]=${lp[$li]}; (( li++ ))
        else
            arr[$k]=${rp[$ri]}; (( ri++ ))
        fi
        (( k++ ))
    done
    while (( li <= ln )); do arr[$k]=${lp[$li]}; (( li++, k++ )); done
    while (( ri <= rn )); do arr[$k]=${rp[$ri]}; (( ri++, k++ )); done
}

n=${#arr[@]}
for (( i=1; i<=n; i+=MIN_RUN )); do
    right=$(( i+MIN_RUN-1 < n ? i+MIN_RUN-1 : n ))
    insertion_sort $i $right
done

size=$MIN_RUN
while (( size < n )); do
    for (( left=1; left<=n; left+=2*size )); do
        mid=$(( left+size-1 < n ? left+size-1 : n ))
        right=$(( left+2*size-1 < n ? left+2*size-1 : n ))
        (( mid < right )) && merge $left $mid $right
    done
    (( size *= 2 ))
done

echo "${arr[@]}"
