let countingSort (arr: int[]) exp =
    let n = arr.Length
    let output = Array.zeroCreate n
    let count = Array.zeroCreate 10
    for i in 0..n-1 do count[(arr.[i] / exp) % 10] <- count[(arr.[i] / exp) % 10] + 1
    for i in 1..9 do count.[i] <- count.[i] + count.[i-1]
    for i in n-1 .. -1 .. 0 do
        let idx = (arr.[i] / exp) % 10
        count.[idx] <- count.[idx] - 1
        output.[count.[idx]] <- arr.[i]
    Array.blit output 0 arr 0 n

let radixSort (arr: int[]) =
    if arr.Length = 0 then arr
    else
        let max = Array.max arr
        let mutable exp = 1
        while max / exp > 0 do
            countingSort arr exp
            exp <- exp * 10
        arr

let arr = [|170; 45; 75; 90; 802; 24; 2; 66|]
printfn "%A" (radixSort arr)
