let heapify (arr: int[]) n i =
    let mutable largest = i
    let left = 2 * i + 1
    let right = 2 * i + 2
    if left < n && arr.[left] > arr.[largest] then largest <- left
    if right < n && arr.[right] > arr.[largest] then largest <- right
    if largest <> i then
        let tmp = arr.[i]
        arr.[i] <- arr.[largest]
        arr.[largest] <- tmp
        heapify arr n largest

let heapsort (arr: int[]) =
    let n = arr.Length
    for i in n / 2 - 1 .. -1 .. 0 do heapify arr n i
    for i in n - 1 .. -1 .. 1 do
        let tmp = arr.[0]
        arr.[0] <- arr.[i]
        arr.[i] <- tmp
        heapify arr i 0

let arr = [|12; 11; 13; 5; 6; 7|]
heapsort arr
printfn "%A" arr
