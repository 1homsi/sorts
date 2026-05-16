open System

let isSorted (arr: int list) =
    arr |> List.pairwise |> List.forall (fun (a, b) -> a <= b)

let shuffle (arr: int list) =
    let rng = Random()
    arr |> List.sortBy (fun _ -> rng.Next())

let bogosort (arr: int list) =
    let mutable current = arr
    while not (isSorted current) do
        current <- shuffle current
    current

let arr = [3; 1; 4; 1; 5; 9; 2; 6]
printfn "%A" (bogosort arr)
