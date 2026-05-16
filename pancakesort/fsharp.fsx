let flip (arr: int[]) k =
    let mutable left = 0
    let mutable right = k
    while left < right do
        let tmp = arr.[left]
        arr.[left] <- arr.[right]
        arr.[right] <- tmp
        left <- left + 1
        right <- right - 1

let pancakeSort (arr: int[]) =
    let mutable size = arr.Length
    while size > 1 do
        let mutable maxIdx = 0
        for i in 1 .. size - 1 do
            if arr.[i] > arr.[maxIdx] then maxIdx <- i
        if maxIdx <> size - 1 then
            if maxIdx <> 0 then flip arr maxIdx
            flip arr (size - 1)
        size <- size - 1
    arr

let arr = [| 3; 6; 2; 7; 4; 1; 5 |]
printfn "%A" (pancakeSort arr)
