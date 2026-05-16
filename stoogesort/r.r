stooge_sort <- function(arr, first, last) {
    if (arr[first] > arr[last]) {
        tmp <- arr[first]
        arr[first] <- arr[last]
        arr[last] <- tmp
    }
    if (last - first + 1 > 2) {
        t <- floor((last - first + 1) * 2 / 3)
        arr <- stooge_sort(arr, first, first + t - 1)
        arr <- stooge_sort(arr, last - t + 1, last)
        arr <- stooge_sort(arr, first, first + t - 1)
    }
    arr
}

arr <- c(3, 1, 4, 1, 5, 9, 2, 6)
result <- stooge_sort(arr, 1, length(arr))
print(result)
