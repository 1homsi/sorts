type tree =
  | Leaf
  | Node(tree, int, tree);

let rec insert = (tree, v) =>
  switch (tree) {
  | Leaf => Node(Leaf, v, Leaf)
  | Node(l, x, r) =>
    if (v < x) {Node(insert(l, v), x, r)}
    else {Node(l, x, insert(r, v))}
  };

let rec inorder = tree =>
  switch (tree) {
  | Leaf => []
  | Node(l, v, r) => inorder(l) @ [v] @ inorder(r)
  };

let treesort = arr => inorder(List.fold_left(insert, Leaf, arr));

let sorted = treesort([5, 3, 7, 1, 4, 6, 8]);
List.iter(v => Printf.printf("%d ", v), sorted);
print_newline();
