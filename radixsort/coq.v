Require Import List Arith.
Import ListNotations.

Fixpoint count_le (n : nat) (xs : list nat) : nat :=
  match xs with
  | [] => 0
  | x :: rest => (if Nat.leb x n then 1 else 0) + count_le n rest
  end.

Definition get_digit (x exp : nat) : nat := (x / exp) mod 10.

Definition counting_sort (xs : list nat) (exp : nat) : list nat :=
  let buckets := map (fun d => filter (fun x => Nat.eqb (get_digit x exp) d) xs) (seq 0 10) in
  concat buckets.

Fixpoint radix_loop (xs : list nat) (max_val exp fuel : nat) : list nat :=
  match fuel with
  | 0 => xs
  | S f =>
    if Nat.eqb (max_val / exp) 0 then xs
    else radix_loop (counting_sort xs exp) max_val (exp * 10) f
  end.

Definition radix_sort (xs : list nat) : list nat :=
  match xs with
  | [] => []
  | _ =>
    let max_val := fold_left Nat.max xs 0 in
    radix_loop xs max_val 1 100
  end.

Compute (radix_sort [170; 45; 75; 90; 802; 24; 2; 66]).
