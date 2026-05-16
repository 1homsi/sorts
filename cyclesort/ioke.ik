cycleSort = method(arr,
    n = arr length
    writes = 0
    cycleStart = 0
    while(cycleStart < (n - 1),
        item = arr[cycleStart]
        pos = cycleStart
        i = cycleStart + 1
        while(i < n,
            if(arr[i] < item, pos = pos + 1)
            i = i + 1
        )
        if(pos != cycleStart,
            while(item == arr[pos], pos = pos + 1)
            tmp = arr[pos]
            arr[pos] = item
            item = tmp
            writes = writes + 1
            while(pos != cycleStart,
                pos = cycleStart
                i = cycleStart + 1
                while(i < n,
                    if(arr[i] < item, pos = pos + 1)
                    i = i + 1
                )
                while(item == arr[pos], pos = pos + 1)
                tmp = arr[pos]
                arr[pos] = item
                item = tmp
                writes = writes + 1
            )
        )
        cycleStart = cycleStart + 1
    )
    arr
)

arr = [5, 4, 3, 2, 1]
cycleSort(arr)
arr println
