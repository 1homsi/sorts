let minRun = 32

let insertionSort (arr: int[]) left right =
    for i in left + 1 .. right do
        let key = arr.[i]
        let mutable j = i - 1
        while j >= left && arr.[j] > key do
            arr.[j + 1] <- arr.[j]
            j <- j - 1
        arr.[j + 1] <- key

let merge (arr: int[]) left mid right =
    let leftPart = arr.[left..mid] |> Array.copy
    let rightPart = arr.[mid + 1..right] |> Array.copy
    let mutable i, j, k = 0, 0, left
    while i < leftPart.Length && j < rightPart.Length do
        if leftPart.[i] <= rightPart.[j] then
            arr.[k] <- leftPart.[i]; i <- i + 1
        else
            arr.[k] <- rightPart.[j]; j <- j + 1
        k <- k + 1
    while i < leftPart.Length do arr.[k] <- leftPart.[i]; i <- i + 1; k <- k + 1
    while j < rightPart.Length do arr.[k] <- rightPart.[j]; j <- j + 1; k <- k + 1

let timsort (arr: int[]) =
    let n = arr.Length
    let mutable i = 0
    while i < n do
        insertionSort arr i (min (i + minRun - 1) (n - 1))
        i <- i + minRun
    let mutable size = minRun
    while size < n do
        let mutable left = 0
        while left < n do
            let mid = min (left + size - 1) (n - 1)
            let right = min (left + 2 * size - 1) (n - 1)
            if mid < right then merge arr left mid right
            left <- left + 2 * size
        size <- size * 2
    arr

let arr = [| 5; 2; 8; 1; 9; 3; 7; 4; 6 |]
let sorted = timsort arr
printfn "%A" sorted
