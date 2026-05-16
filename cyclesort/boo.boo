def cycleSort(arr as (int)) as int:
    writes = 0
    n = len(arr)
    for cycleStart in range(n - 1):
        item = arr[cycleStart]
        pos = cycleStart
        for i in range(cycleStart + 1, n):
            if arr[i] < item:
                pos += 1
        if pos == cycleStart:
            continue
        while item == arr[pos]:
            pos += 1
        tmp = arr[pos]
        arr[pos] = item
        item = tmp
        writes += 1
        while pos != cycleStart:
            pos = cycleStart
            for i in range(cycleStart + 1, n):
                if arr[i] < item:
                    pos += 1
            while item == arr[pos]:
                pos += 1
            tmp = arr[pos]
            arr[pos] = item
            item = tmp
            writes += 1
    return writes

arr = (5, 4, 3, 2, 1)
cycleSort(arr)
print(join(arr, " "))
