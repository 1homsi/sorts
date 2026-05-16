let insertionSort (bucket: float list) =
    let arr = List.toArray bucket
    for i in 1 .. arr.Length - 1 do
        let key = arr.[i]
        let mutable j = i - 1
        while j >= 0 && arr.[j] > key do
            arr.[j + 1] <- arr.[j]
            j <- j - 1
        arr.[j + 1] <- key
    Array.toList arr

let bucketSort (arr: float list) =
    if arr.IsEmpty then arr
    else
        let n = arr.Length
        let mn = List.min arr
        let mx = List.max arr
        let getIdx x = min (n - 1) (int ((x - mn) / (mx - mn + 1.0) * float n))
        let buckets = arr |> List.fold (fun bs x ->
            let idx = getIdx x
            bs |> List.mapi (fun i b -> if i = idx then b @ [x] else b)
        ) (List.replicate n [])
        buckets |> List.collect insertionSort

printfn "%A" (bucketSort [0.78; 0.17; 0.39; 0.26; 0.72; 0.94; 0.21; 0.12; 0.23; 0.68])
