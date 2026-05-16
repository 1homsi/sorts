module TreeSort

data Tree : Type where
  Leaf : Tree
  Node : Tree -> Int -> Tree -> Tree

insert : Tree -> Int -> Tree
insert Leaf v = Node Leaf v Leaf
insert (Node l x r) v =
  if v < x then Node (insert l v) x r
            else Node l x (insert r v)

inorder : Tree -> List Int
inorder Leaf = []
inorder (Node l v r) = inorder l ++ [v] ++ inorder r

treesort : List Int -> List Int
treesort arr = inorder (foldl insert Leaf arr)

main : IO ()
main = printLn (treesort [5, 3, 7, 1, 4, 6, 8])
