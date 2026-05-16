let countingSort (arr: int[]) =
    if arr.Length = 0 then arr
    else
        let max = Array.max arr
        let min = Array.min arr
        let range = max - min + 1
        let count = Array.create range 0
        Array.iter (fun v -> count.[v - min] <- count.[v - min] + 1) arr
        for i in 1 .. range - 1 do count.[i] <- count.[i] + count.[i - 1]
        let output = Array.create arr.Length 0
        for i in arr.Length - 1 .. -1 .. 0 do
            count.[arr.[i] - min] <- count.[arr.[i] - min] - 1
            output.[count.[arr.[i] - min]] <- arr.[i]
        output

printfn "%A" (countingSort [|4; 2; 2; 8; 3; 3; 1|])
