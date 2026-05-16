array arr[5]
arr[1] = 5; arr[2] = 3; arr[3] = 1; arr[4] = 4; arr[5] = 2
n = 5

do for [i=1:n-1] {
    minIdx = i
    do for [j=i+1:n] {
        if (arr[j] < arr[minIdx]) { minIdx = j }
    }
    tmp = arr[i]; arr[i] = arr[minIdx]; arr[minIdx] = tmp
}

do for [i=1:n] {
    print arr[i]
}
