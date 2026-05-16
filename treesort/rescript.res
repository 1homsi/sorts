type tree =
  | Leaf
  | Node(tree, int, tree)

let rec insert = (tree, v) =>
  switch tree {
  | Leaf => Node(Leaf, v, Leaf)
  | Node(l, x, r) =>
    if v < x {Node(insert(l, v), x, r)}
    else {Node(l, x, insert(r, v))}
  }

let rec inorder = tree =>
  switch tree {
  | Leaf => list{}
  | Node(l, v, r) => Belt.List.concatMany([inorder(l), list{v}, inorder(r)])
  }

let treesort = arr => inorder(Belt.List.reduce(arr, Leaf, insert))

let sorted = treesort(list{5, 3, 7, 1, 4, 6, 8})
Belt.List.forEach(sorted, v => Js.log2(v, ""))
