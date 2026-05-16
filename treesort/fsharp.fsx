type Tree = Leaf | Node of Tree * int * Tree

let rec insert tree v =
    match tree with
    | Leaf -> Node(Leaf, v, Leaf)
    | Node(l, x, r) ->
        if v < x then Node(insert l v, x, r)
        else Node(l, x, insert r v)

let rec inorder tree =
    match tree with
    | Leaf -> []
    | Node(l, v, r) -> inorder l @ [v] @ inorder r

let treesort arr =
    List.fold insert Leaf arr |> inorder

printfn "%A" (treesort [5; 3; 7; 1; 4; 6; 8])
