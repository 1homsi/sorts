Inductive tree : Type :=
  | Leaf : tree
  | Node : tree -> nat -> tree -> tree.

Fixpoint insert (t : tree) (v : nat) : tree :=
  match t with
  | Leaf => Node Leaf v Leaf
  | Node l x r =>
    if Nat.ltb v x
    then Node (insert l v) x r
    else Node l x (insert r v)
  end.

Fixpoint inorder (t : tree) : list nat :=
  match t with
  | Leaf => nil
  | Node l v r => inorder l ++ (v :: nil) ++ inorder r
  end.

Definition treesort (arr : list nat) : list nat :=
  inorder (fold_left insert arr Leaf).

Compute treesort (5 :: 3 :: 7 :: 1 :: 4 :: 6 :: 8 :: nil).
