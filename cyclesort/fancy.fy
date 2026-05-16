def cycle_sort: arr {
    n = arr size
    writes = 0
    cycle_start = 0
    { cycle_start < (n - 1) } whileTrue: {
        item = arr[cycle_start]
        pos = cycle_start
        i = cycle_start + 1
        { i < n } whileTrue: {
            (arr[i] < item) if_true: { pos = pos + 1 }
            i = i + 1
        }
        (pos != cycle_start) if_true: {
            { item == (arr[pos]) } whileTrue: { pos = pos + 1 }
            tmp = arr[pos]
            arr[pos] = item
            item = tmp
            writes = writes + 1
            { pos != cycle_start } whileTrue: {
                pos = cycle_start
                i = cycle_start + 1
                { i < n } whileTrue: {
                    (arr[i] < item) if_true: { pos = pos + 1 }
                    i = i + 1
                }
                { item == (arr[pos]) } whileTrue: { pos = pos + 1 }
                tmp = arr[pos]
                arr[pos] = item
                item = tmp
                writes = writes + 1
            }
        }
        cycle_start = cycle_start + 1
    }
    arr
}

arr = [5, 4, 3, 2, 1]
cycle_sort: arr
arr println
