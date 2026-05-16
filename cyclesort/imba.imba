def cycleSort(arr)
    let writes = 0
    let n = arr.length
    for let cycleStart = 0; cycleStart < n - 1; cycleStart++
        let item = arr[cycleStart]
        let pos = cycleStart
        for let i = cycleStart + 1; i < n; i++
            if arr[i] < item
                pos++
        if pos == cycleStart
            continue
        while item == arr[pos]
            pos++
        let tmp = arr[pos]
        arr[pos] = item
        item = tmp
        writes++
        while pos != cycleStart
            pos = cycleStart
            for let i = cycleStart + 1; i < n; i++
                if arr[i] < item
                    pos++
            while item == arr[pos]
                pos++
            let t = arr[pos]
            arr[pos] = item
            item = t
            writes++
    writes

let arr = [5, 4, 3, 2, 1]
cycleSort(arr)
console.log(arr)
