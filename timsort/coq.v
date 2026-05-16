Require Import List.
Require Import Nat.
Import ListNotations.

Fixpoint insert (x : nat) (lst : list nat) : list nat :=
  match lst with
  | [] => [x]
  | h :: t => if x <=? h then x :: h :: t else h :: insert x t
  end.

Fixpoint insertion_sort (lst : list nat) : list nat :=
  match lst with
  | [] => []
  | h :: t => insert h (insertion_sort t)
  end.

Fixpoint merge_runs (xs ys : list nat) : list nat :=
  match xs, ys with
  | [], _ => ys
  | _, [] => xs
  | x :: xs', y :: ys' =>
      if x <=? y then x :: merge_runs xs' ys
      else y :: merge_runs xs ys'
  end.

Fixpoint chunks_of (n : nat) (lst : list nat) : list (list nat) :=
  match lst with
  | [] => []
  | _ => firstn n lst :: chunks_of n (skipn n lst)
  end.

Fixpoint merge_pairs (runs : list (list nat)) : list (list nat) :=
  match runs with
  | [] => []
  | [x] => [x]
  | x :: y :: rest => merge_runs x y :: merge_pairs rest
  end.

Fixpoint merge_all_aux (fuel : nat) (runs : list (list nat)) : list nat :=
  match fuel with
  | 0 => concat runs
  | S n =>
      match runs with
      | [] => []
      | [x] => x
      | _ => merge_all_aux n (merge_pairs runs)
      end
  end.

Definition merge_all (runs : list (list nat)) : list nat :=
  merge_all_aux (length runs) runs.

Definition timsort (lst : list nat) : list nat :=
  match lst with
  | [] => []
  | _ => merge_all (map insertion_sort (chunks_of 32 lst))
  end.

Compute timsort [5; 2; 8; 1; 9; 3; 7; 4; 6].
