let cycleSort (arr: int[]) =
    let mutable writes = 0
    let n = arr.Length
    for cycleStart in 0 .. n - 2 do
        let mutable item = arr.[cycleStart]
        let mutable pos = cycleStart
        for i in cycleStart + 1 .. n - 1 do
            if arr.[i] < item then pos <- pos + 1
        if pos <> cycleStart then
            while item = arr.[pos] do pos <- pos + 1
            let tmp = arr.[pos]
            arr.[pos] <- item
            item <- tmp
            writes <- writes + 1
            while pos <> cycleStart do
                pos <- cycleStart
                for i in cycleStart + 1 .. n - 1 do
                    if arr.[i] < item then pos <- pos + 1
                while item = arr.[pos] do pos <- pos + 1
                let t = arr.[pos]
                arr.[pos] <- item
                item <- t
                writes <- writes + 1
    writes

let arr = [|5; 4; 3; 2; 1|]
cycleSort arr |> ignore
printfn "%A" arr
