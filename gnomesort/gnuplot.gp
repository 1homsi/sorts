arr = "5 3 8 1 9 2 7 4 6 0"
n = 10

array data[n]
do for [k=1:n] {
    data[k] = int(word(arr, k))
}

i = 1
while (i <= n) {
    if (i == 1) {
        i = i + 1
    } else {
        if (data[i] >= data[i-1]) {
            i = i + 1
        } else {
            tmp = data[i]
            data[i] = data[i-1]
            data[i-1] = tmp
            i = i - 1
        }
    }
}

do for [k=1:n] { print data[k] }
