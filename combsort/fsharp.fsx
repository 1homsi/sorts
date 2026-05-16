let combSort (arr: int[]) =
    let n = arr.Length
    let mutable gap = n
    let mutable sorted = false
    while not sorted do
        gap <- int (float gap / 1.3)
        if gap <= 1 then
            gap <- 1
            sorted <- true
        let mutable i = 0
        while i + gap < n do
            if arr.[i] > arr.[i + gap] then
                let tmp = arr.[i]
                arr.[i] <- arr.[i + gap]
                arr.[i + gap] <- tmp
                sorted <- false
            i <- i + 1
    arr
