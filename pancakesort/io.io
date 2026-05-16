PancakeSort := Object clone do(
    flip := method(arr, k,
        left := 0
        right := k
        while(left < right,
            tmp := arr at(left)
            arr atPut(left, arr at(right))
            arr atPut(right, tmp)
            left = left + 1
            right = right - 1
        )
    )

    findMaxIdx := method(arr, size,
        maxIdx := 0
        for(i, 1, size - 1,
            if(arr at(i) > arr at(maxIdx), maxIdx = i)
        )
        maxIdx
    )

    sort := method(arr,
        size := arr size
        while(size > 1,
            maxIdx := findMaxIdx(arr, size)
            if(maxIdx != size - 1,
                if(maxIdx != 0, flip(arr, maxIdx))
                flip(arr, size - 1)
            )
            size = size - 1
        )
        arr
    )
)

arr := list(3, 6, 2, 7, 4, 1, 5)
PancakeSort sort(arr) println
