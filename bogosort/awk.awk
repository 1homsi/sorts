BEGIN {
    srand()
    while (!is_sorted()) {
        shuffle()
    }
}

function is_sorted() {
    for (i = 1; i < length(arr); i++) {
        if (arr[i] > arr[i+1]) return 0
    }
    return 1
}

function shuffle() {
    for (i = length(arr); i > 1; i--) {
        j = int(rand() * i) + 1
        tmp = arr[i]
        arr[i] = arr[j]
        arr[j] = tmp
    }
}
