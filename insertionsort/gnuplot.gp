array arr[5]
arr[1] = 5; arr[2] = 3; arr[3] = 1; arr[4] = 4; arr[5] = 2
n = 5

do for [i=2:n] {
    key = arr[i]
    j = i - 1
    while (j >= 1 && arr[j] > key) {
        arr[j+1] = arr[j]
        j = j - 1
    }
    arr[j+1] = key
}

print arr
