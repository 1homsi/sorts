Require Import List Arith.
Import ListNotations.

Fixpoint bubble_pass (l : list nat) : list nat * bool :=
  match l with
  | [] => ([], false)
  | [x] => ([x], false)
  | x :: y :: rest =>
    if Nat.leb x y then
      let (sorted, sw) := bubble_pass (y :: rest) in
      (x :: sorted, sw)
    else
      let (sorted, _) := bubble_pass (x :: rest) in
      (y :: sorted, true)
  end.

Fixpoint bubble_sort_fuel (fuel : nat) (l : list nat) : list nat :=
  match fuel with
  | 0 => l
  | S n =>
    let (sorted, swapped) := bubble_pass l in
    if swapped then bubble_sort_fuel n sorted else sorted
  end.

Definition bubble_sort (l : list nat) : list nat :=
  bubble_sort_fuel (length l * length l) l.

Compute bubble_sort [64; 34; 25; 12; 22; 11; 90].
