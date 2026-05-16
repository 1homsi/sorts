cycleSort := method(arr,
    n := arr size
    writes := 0
    cycleStart := 0
    while(cycleStart < n - 1,
        item := arr at(cycleStart)
        pos := cycleStart
        i := cycleStart + 1
        while(i < n,
            if(arr at(i) < item, pos = pos + 1)
            i = i + 1
        )
        if(pos != cycleStart,
            while(item == arr at(pos), pos = pos + 1)
            tmp := arr at(pos)
            arr atPut(pos, item)
            item = tmp
            writes = writes + 1
            while(pos != cycleStart,
                pos = cycleStart
                i = cycleStart + 1
                while(i < n,
                    if(arr at(i) < item, pos = pos + 1)
                    i = i + 1
                )
                while(item == arr at(pos), pos = pos + 1)
                tmp = arr at(pos)
                arr atPut(pos, item)
                item = tmp
                writes = writes + 1
            )
        )
        cycleStart = cycleStart + 1
    )
    writes
)

arr := list(5, 4, 3, 2, 1)
cycleSort(arr)
arr println
