module Main exposing (main)

import Html exposing (text)

type Tree comparable
    = Leaf
    | Node (Tree comparable) comparable (Tree comparable)

insert : Tree comparable -> comparable -> Tree comparable
insert tree v =
    case tree of
        Leaf -> Node Leaf v Leaf
        Node l x r ->
            if v < x then Node (insert l v) x r
            else Node l x (insert r v)

inorder : Tree comparable -> List comparable
inorder tree =
    case tree of
        Leaf -> []
        Node l v r -> inorder l ++ [ v ] ++ inorder r

treesort : List comparable -> List comparable
treesort arr =
    List.foldl (\v t -> insert t v) Leaf arr |> inorder

main =
    text (Debug.toString (treesort [ 5, 3, 7, 1, 4, 6, 8 ]))
