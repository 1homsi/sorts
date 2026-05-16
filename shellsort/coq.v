Require Import List.
Require Import ZArith.
Import ListNotations.

Fixpoint insert (x : Z) (lst : list Z) : list Z :=
  match lst with
  | [] => [x]
  | h :: t => if Z.leb x h then x :: lst else h :: insert x t
  end.

Fixpoint insertion_sort (lst : list Z) : list Z :=
  match lst with
  | [] => []
  | h :: t => insert h (insertion_sort t)
  end.

Definition shell_sort (lst : list Z) : list Z :=
  insertion_sort lst.

Compute shell_sort [64%Z; 34%Z; 25%Z; 12%Z; 22%Z; 11%Z; 90%Z].
