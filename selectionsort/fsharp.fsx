let selectionSort (arr: int[]) =
    let n = arr.Length
    for i in 0 .. n - 1 do
        let mutable minIdx = i
        for j in i + 1 .. n - 1 do
            if arr.[j] < arr.[minIdx] then minIdx <- j
        let tmp = arr.[i]
        arr.[i] <- arr.[minIdx]
        arr.[minIdx] <- tmp
    arr
