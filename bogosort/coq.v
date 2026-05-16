Require Import List.
Require Import Arith.
Import ListNotations.

Fixpoint is_sorted (l : list nat) : bool :=
  match l with
  | [] => true
  | [_] => true
  | x :: y :: rest =>
    if Nat.leb x y then is_sorted (y :: rest) else false
  end.

Axiom shuffle : list nat -> list nat.

Definition arr : list nat := [3; 1; 4; 1; 5; 9; 2; 6].

Compute is_sorted [1; 1; 2; 3; 4; 5; 6; 9].
