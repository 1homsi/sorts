cycle-sort = (arr) ->
    writes = 0
    n = arr.length
    for cycle-start from 0 to n - 2
        item = arr[cycle-start]
        pos = cycle-start
        for i from cycle-start + 1 to n - 1
            if arr[i] < item then pos++
        continue if pos is cycle-start
        while item is arr[pos] then pos++
        [arr[pos], item] = [item, arr[pos]]
        writes++
        while pos isnt cycle-start
            pos = cycle-start
            for i from cycle-start + 1 to n - 1
                if arr[i] < item then pos++
            while item is arr[pos] then pos++
            [arr[pos], item] = [item, arr[pos]]
            writes++
    writes

arr = [5, 4, 3, 2, 1]
cycle-sort arr
console.log arr
