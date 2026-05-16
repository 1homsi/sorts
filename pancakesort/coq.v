Require Import List.
Require Import Arith.
Import ListNotations.

Fixpoint flip (l : list nat) (k : nat) : list nat :=
  match k with
  | 0 => l
  | S k' =>
    let prefix := firstn (S (S k')) l in
    let suffix := skipn (S (S k')) l in
    (rev prefix) ++ suffix
  end.

Fixpoint find_max_idx (l : list nat) (size : nat) : nat :=
  match l, size with
  | _, 0 => 0
  | [], _ => 0
  | x :: xs, S size' =>
    let rest_idx := find_max_idx xs size' in
    if nth_default 0 xs rest_idx <? x then 0
    else S rest_idx
  end.

Fixpoint pancake_sort_aux (l : list nat) (size : nat) : list nat :=
  match size with
  | 0 | 1 => l
  | S (S size'') =>
    let max_idx := find_max_idx l (S (S size'')) in
    let l1 := if Nat.eqb max_idx 0 then l else flip l (pred max_idx) in
    let l2 := flip l1 (S size'') in
    pancake_sort_aux l2 (S size'')
  end.

Definition pancake_sort (l : list nat) : list nat :=
  pancake_sort_aux l (length l).

Compute pancake_sort [3; 6; 2; 7; 4; 1; 5].
