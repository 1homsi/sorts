let gnomeSort (arr: int[]) =
    let mutable i = 0
    while i < arr.Length do
        if i = 0 || arr.[i] >= arr.[i - 1] then
            i <- i + 1
        else
            let tmp = arr.[i]
            arr.[i] <- arr.[i - 1]
            arr.[i - 1] <- tmp
            i <- i - 1
    arr
