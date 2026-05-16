Require Import List.
Require Import Nat.

Fixpoint list_min (l : list nat) (default : nat) : nat :=
  match l with
  | nil => default
  | x :: xs => min x (list_min xs default)
  end.

Fixpoint remove_first (x : nat) (l : list nat) : list nat :=
  match l with
  | nil => nil
  | y :: ys => if Nat.eqb x y then ys else y :: remove_first x ys
  end.

Fixpoint selection_sort (l : list nat) : list nat :=
  match l with
  | nil => nil
  | _ =>
    let m := list_min l 0 in
    m :: selection_sort (remove_first m l)
  end.
