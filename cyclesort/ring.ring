func cycleSort arr
    n = len(arr)
    writes = 0
    for cycleStart = 1 to n - 1
        item = arr[cycleStart]
        pos = cycleStart
        for i = cycleStart + 1 to n
            if arr[i] < item
                pos++
            ok
        next
        if pos = cycleStart
            loop
        ok
        while arr[pos] = item
            pos++
        end
        tmp = arr[pos]
        arr[pos] = item
        item = tmp
        writes++
        while pos != cycleStart
            pos = cycleStart
            for i = cycleStart + 1 to n
                if arr[i] < item
                    pos++
                ok
            next
            while arr[pos] = item
                pos++
            end
            tmp = arr[pos]
            arr[pos] = item
            item = tmp
            writes++
        end
    next
    return arr

arr = [5, 4, 3, 2, 1]
arr = cycleSort(arr)
see arr
