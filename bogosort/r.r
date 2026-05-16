bogosort <- function(arr) {
    while (!is_sorted(arr)) {
        arr <- sample(arr)
    }
    arr
}

is_sorted <- function(arr) {
    all(arr[-length(arr)] <= arr[-1])
}
