datatype tree = Leaf | Node of tree * int * tree

fun insert Leaf v = Node(Leaf, v, Leaf)
  | insert (Node(l, x, r)) v =
    if v < x then Node(insert l v, x, r)
    else Node(l, x, insert r v)

fun inorder Leaf = []
  | inorder (Node(l, v, r)) = inorder l @ [v] @ inorder r

fun treesort arr =
  inorder (foldl (fn (v, t) => insert t v) Leaf arr)

val sorted = treesort [5, 3, 7, 1, 4, 6, 8]
val _ = print (String.concatWith " " (map Int.toString sorted) ^ "\n")
