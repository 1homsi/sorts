cycleSort = (arr) ->
    writes = 0
    n = #arr
    for cycleStart = 1, n - 1
        item = arr[cycleStart]
        pos = cycleStart
        for i = cycleStart + 1, n
            if arr[i] < item then pos += 1
        continue if pos == cycleStart
        while item == arr[pos] then pos += 1
        arr[pos], item = item, arr[pos]
        writes += 1
        while pos != cycleStart
            pos = cycleStart
            for i = cycleStart + 1, n
                if arr[i] < item then pos += 1
            while item == arr[pos] then pos += 1
            arr[pos], item = item, arr[pos]
            writes += 1
    writes

arr = {5, 4, 3, 2, 1}
cycleSort arr
print table.concat arr, " "
