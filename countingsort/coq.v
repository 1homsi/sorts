Require Import Coq.Lists.List.
Require Import Coq.Sorting.Sorting.
Import ListNotations.

Fixpoint count_occ (n : nat) (lst : list nat) : nat :=
  match lst with
  | [] => 0
  | h :: t => if Nat.eqb h n then S (count_occ n t) else count_occ n t
  end.

Fixpoint repeat_nat (n k : nat) : list nat :=
  match k with
  | 0 => []
  | S k' => n :: repeat_nat n k'
  end.

Fixpoint counting_sort_aux (i max_val : nat) (arr : list nat) : list nat :=
  match max_val with
  | 0 => repeat_nat i (count_occ i arr)
  | S m => repeat_nat i (count_occ i arr) ++ counting_sort_aux (S i) m arr
  end.

Definition counting_sort (arr : list nat) : list nat :=
  match arr with
  | [] => []
  | _ => let max_val := fold_left Nat.max arr 0 in
         counting_sort_aux 0 max_val arr
  end.

Compute counting_sort [4; 2; 2; 8; 3; 3; 1].
