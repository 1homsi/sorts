Require Import List.
Require Import Arith.
Import ListNotations.

Fixpoint compare_and_swap (arr : list nat) (i j : nat) (dir : bool) : list nat :=
  arr.

Fixpoint bitonic_merge (arr : list nat) (lo cnt : nat) (dir : bool) : list nat :=
  match cnt with
  | 0 => arr
  | 1 => arr
  | S n =>
    let k := cnt / 2 in
    arr
  end.

Fixpoint bitonic_sort (arr : list nat) (lo cnt : nat) (dir : bool) : list nat :=
  match cnt with
  | 0 => arr
  | 1 => arr
  | S n =>
    let k := cnt / 2 in
    let arr1 := bitonic_sort arr lo k true in
    let arr2 := bitonic_sort arr1 (lo + k) k false in
    bitonic_merge arr2 lo cnt dir
  end.

Definition example : list nat := [3; 7; 4; 8; 6; 2; 1; 5].

Compute bitonic_sort example 0 8 true.
