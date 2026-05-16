PancakeSort = Origin mimic do(
    flip = method(arr, k,
        left = 0
        right = k
        while(left < right,
            tmp = arr[left]
            arr[left] = arr[right]
            arr[right] = tmp
            left++
            right--
        )
    )

    findMaxIdx = method(arr, size,
        maxIdx = 0
        i = 1
        while(i < size,
            if(arr[i] > arr[maxIdx], maxIdx = i)
            i++
        )
        maxIdx
    )

    sort = method(arr,
        size = arr length
        while(size > 1,
            maxIdx = findMaxIdx(arr, size)
            if(maxIdx != (size - 1),
                if(maxIdx != 0, flip(arr, maxIdx))
                flip(arr, size - 1)
            )
            size--
        )
        arr
    )
)

arr = [3, 6, 2, 7, 4, 1, 5]
PancakeSort sort(arr) println
