shellSort = method(arr,
    n = arr length
    gap = (n / 2) floor
    while(gap > 0,
        for(i, gap, n - 1,
            temp = arr[i]
            j = i
            while(j >= gap && arr[j - gap] > temp,
                arr[j] = arr[j - gap]
                j -= gap
            )
            arr[j] = temp
        )
        gap = (gap / 2) floor
    )
    arr
)

arr = [64, 34, 25, 12, 22, 11, 90]
shellSort(arr) println
