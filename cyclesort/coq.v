Require Import List.
Require Import Arith.
Import ListNotations.

Fixpoint count_smaller (lst : list nat) (item : nat) : nat :=
  match lst with
  | [] => 0
  | x :: xs =>
    if x <? item
    then S (count_smaller xs item)
    else count_smaller xs item
  end.

Fixpoint insert_sorted (x : nat) (lst : list nat) : list nat :=
  match lst with
  | [] => [x]
  | h :: t =>
    if x <=? h
    then x :: lst
    else h :: insert_sorted x t
  end.

Fixpoint cycle_sort (lst : list nat) : list nat :=
  match lst with
  | [] => []
  | x :: xs => insert_sorted x (cycle_sort xs)
  end.

Compute cycle_sort [5; 4; 3; 2; 1].
