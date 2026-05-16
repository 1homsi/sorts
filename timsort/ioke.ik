TimSort = Origin mimic do(
    minRun = 32

    insertionSort = method(arr, left, right,
        i = left + 1
        while(i <= right,
            key = arr[i]
            j = i - 1
            while(j >= left && arr[j] > key,
                arr[j + 1] = arr[j]
                j -= 1
            )
            arr[j + 1] = key
            i += 1
        )
    )

    merge = method(arr, left, mid, right,
        lp = arr[left..(mid+1)]
        rp = arr[(mid+1)..(right+1)]
        i = 0; j = 0; k = left
        while(i < lp length && j < rp length,
            if(lp[i] <= rp[j],
                arr[k] = lp[i]; i += 1
            ,
                arr[k] = rp[j]; j += 1
            )
            k += 1
        )
        while(i < lp length, arr[k] = lp[i]; i += 1; k += 1)
        while(j < rp length, arr[k] = rp[j]; j += 1; k += 1)
    )

    sort = method(arr,
        n = arr length
        i = 0
        while(i < n,
            right = (i + minRun - 1) min(n - 1)
            insertionSort(arr, i, right)
            i += minRun
        )
        size = minRun
        while(size < n,
            left = 0
            while(left < n,
                mid = (left + size - 1) min(n - 1)
                right = (left + 2 * size - 1) min(n - 1)
                if(mid < right, merge(arr, left, mid, right))
                left += 2 * size
            )
            size *= 2
        )
        arr
    )
)

arr = [5, 2, 8, 1, 9, 3, 7, 4, 6]
TimSort sort(arr) println
