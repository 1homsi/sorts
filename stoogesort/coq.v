Require Import List.
Import ListNotations.

Fixpoint nth_set (n : nat) (x : Z) (l : list Z) : list Z :=
    match l, n with
    | [], _ => []
    | _ :: t, 0 => x :: t
    | h :: t, S n' => h :: nth_set n' x t
    end.

Definition stooge_step (arr : list Z) (first last : nat) : list Z :=
    let a := nth first arr 0%Z in
    let b := nth last arr 0%Z in
    if Z.gtb a b then
        nth_set first b (nth_set last a arr)
    else arr.
