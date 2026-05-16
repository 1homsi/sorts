let cocktailSort (arr: int[]) =
    let mutable swapped = true
    let mutable start = 0
    let mutable ending = arr.Length - 1
    while swapped do
        swapped <- false
        for i in start .. ending - 1 do
            if arr.[i] > arr.[i + 1] then
                let tmp = arr.[i]
                arr.[i] <- arr.[i + 1]
                arr.[i + 1] <- tmp
                swapped <- true
        if swapped then
            swapped <- false
            ending <- ending - 1
            for i in ending - 1 .. -1 .. start do
                if arr.[i] > arr.[i + 1] then
                    let tmp = arr.[i]
                    arr.[i] <- arr.[i + 1]
                    arr.[i + 1] <- tmp
                    swapped <- true
            start <- start + 1
    arr
