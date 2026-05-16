inductive Tree where
  | leaf : Tree
  | node : Tree → Int → Tree → Tree

def insert : Tree → Int → Tree
  | .leaf, v => .node .leaf v .leaf
  | .node l x r, v =>
    if v < x then .node (insert l v) x r
    else .node l x (insert r v)

def inorder : Tree → List Int
  | .leaf => []
  | .node l v r => inorder l ++ [v] ++ inorder r

def treesort (arr : List Int) : List Int :=
  inorder (arr.foldl insert .leaf)

#eval treesort [5, 3, 7, 1, 4, 6, 8]
