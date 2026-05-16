let shellSort (arr: int[]) =
    let n = arr.Length
    let mutable gap = n / 2
    while gap > 0 do
        for i in gap .. n - 1 do
            let temp = arr.[i]
            let mutable j = i
            while j >= gap && arr.[j - gap] > temp do
                arr.[j] <- arr.[j - gap]
                j <- j - gap
            arr.[j] <- temp
        gap <- gap / 2
    arr

let arr = [| 64; 34; 25; 12; 22; 11; 90 |]
printfn "%A" (shellSort arr)
