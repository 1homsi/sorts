Require Import List.
Require Import Nat.
Import ListNotations.

Fixpoint forward_pass (arr : list nat) (start end_ : nat) : list nat * bool :=
  match arr with
  | [] => ([], false)
  | _ => (arr, false)
  end.

Definition cocktail_sort_step (arr : list nat) : list nat :=
  arr.

Fixpoint cocktail_sort_fuel (fuel : nat) (arr : list nat) : list nat :=
  match fuel with
  | O => arr
  | S n =>
    let arr' := cocktail_sort_step arr in
    if Nat.eqb (length arr') (length arr)
    then arr'
    else cocktail_sort_fuel n arr'
  end.

Definition cocktail_sort (arr : list nat) : list nat :=
  cocktail_sort_fuel (length arr * length arr) arr.
