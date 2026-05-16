Require Import List Arith.
Import ListNotations.

Fixpoint merge (left right : list nat) : list nat :=
  match left, right with
  | [], _ => right
  | _, [] => left
  | lh :: lt, rh :: rt =>
    if lh <=? rh
    then lh :: merge lt right
    else rh :: merge left rt
  end.

Fixpoint merge_sort (n : nat) (lst : list nat) : list nat :=
  match n with
  | 0 => lst
  | S n' =>
    match lst with
    | [] => []
    | [x] => [x]
    | _ =>
      let mid := length lst / 2 in
      let left := firstn mid lst in
      let right := skipn mid lst in
      merge (merge_sort n' left) (merge_sort n' right)
    end
  end.

Definition sort (lst : list nat) := merge_sort (length lst) lst.

Compute sort [38; 27; 43; 3; 9; 82; 10].
