CombSort = Origin mimic do(
    sort = method(arr,
        n = arr length
        gap = n
        sorted = false
        while(sorted not,
            gap = (gap / 1.3) floor
            if(gap <= 1,
                gap = 1
                sorted = true
            )
            i = 0
            while(i + gap < n,
                if(arr[i] > arr[i + gap],
                    tmp = arr[i]
                    arr[i] = arr[i + gap]
                    arr[i + gap] = tmp
                    sorted = false
                )
                i++
            )
        )
        arr
    )
)
