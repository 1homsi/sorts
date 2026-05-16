let compareAndSwap (arr: int[]) i j direction =
    if direction = (arr.[i] > arr.[j]) then
        let tmp = arr.[i]
        arr.[i] <- arr.[j]
        arr.[j] <- tmp

let rec bitonicMerge (arr: int[]) lo cnt direction =
    if cnt > 1 then
        let k = cnt / 2
        for i in lo .. lo + k - 1 do
            compareAndSwap arr i (i + k) direction
        bitonicMerge arr lo k direction
        bitonicMerge arr (lo + k) k direction

let rec bitonicSort (arr: int[]) lo cnt direction =
    if cnt > 1 then
        let k = cnt / 2
        bitonicSort arr lo k true
        bitonicSort arr (lo + k) k false
        bitonicMerge arr lo cnt direction

let data = [| 3; 7; 4; 8; 6; 2; 1; 5 |]
bitonicSort data 0 data.Length true
printfn "%A" data
