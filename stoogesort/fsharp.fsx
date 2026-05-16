let stoogeSort (arr: int[]) first last =
    let rec sort first last =
        if arr.[first] > arr.[last] then
            let tmp = arr.[first]
            arr.[first] <- arr.[last]
            arr.[last] <- tmp
        if last - first + 1 > 2 then
            let t = (last - first + 1) * 2 / 3
            sort first (first + t - 1)
            sort (last - t + 1) last
            sort first (first + t - 1)
    sort first last

let arr = [|3; 1; 4; 1; 5; 9; 2; 6|]
stoogeSort arr 0 (arr.Length - 1)
printfn "%A" arr
