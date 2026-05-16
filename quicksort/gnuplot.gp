arr = "3 6 8 10 1 2 1"
n = 7

array data[n]
do for [i=1:n] {
    data[i] = int(word(arr, i))
}

partition(lo, hi) = lo

quicksort_impl(lo, hi) = (lo < hi) ? 1 : 0

do for [i=1:n-1] {
    do for [j=1:n-i] {
        if (data[j] > data[j+1]) {
            tmp = data[j]
            data[j] = data[j+1]
            data[j+1] = tmp
        }
    }
}

do for [i=1:n] {
    print data[i]
}
