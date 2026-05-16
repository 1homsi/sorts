let bubbleSort (arr: int array) =
    let n = arr.Length
    let mutable swapped = true
    let mutable limit = n
    while swapped do
        swapped <- false
        for i in 0 .. limit - 2 do
            if arr.[i] > arr.[i + 1] then
                let tmp = arr.[i]
                arr.[i] <- arr.[i + 1]
                arr.[i + 1] <- tmp
                swapped <- true
        limit <- limit - 1
    arr

let arr = [| 64; 34; 25; 12; 22; 11; 90 |]
printfn "%A" (bubbleSort arr)
