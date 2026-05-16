Require Import List Arith.
Import ListNotations.

Fixpoint list_set (l : list nat) (i : nat) (v : nat) : list nat :=
  match l, i with
  | [], _ => []
  | _ :: t, 0 => v :: t
  | h :: t, S n => h :: list_set t n v
  end.

Definition list_get (l : list nat) (i : nat) : nat :=
  nth i l 0.

Definition swap_list (l : list nat) (i j : nat) : list nat :=
  let vi := list_get l i in
  let vj := list_get l j in
  list_set (list_set l i vj) j vi.

Fixpoint heapify (fuel : nat) (arr : list nat) (n i : nat) : list nat :=
  match fuel with
  | 0 => arr
  | S f =>
    let left := 2 * i + 1 in
    let right := 2 * i + 2 in
    let largest0 := if andb (Nat.ltb left n) (Nat.ltb (list_get arr i) (list_get arr left)) then left else i in
    let largest := if andb (Nat.ltb right n) (Nat.ltb (list_get arr largest0) (list_get arr right)) then right else largest0 in
    if Nat.eqb largest i then arr
    else heapify f (swap_list arr i largest) n largest
  end.

Fixpoint build_heap_loop (fuel : nat) (arr : list nat) (n i : nat) : list nat :=
  match fuel with
  | 0 => arr
  | S f =>
    let arr' := heapify n arr n i in
    if Nat.eqb i 0 then arr' else build_heap_loop f arr' n (i - 1)
  end.

Fixpoint sort_loop (fuel : nat) (arr : list nat) (n i : nat) : list nat :=
  match fuel with
  | 0 => arr
  | S f =>
    let arr' := swap_list arr 0 i in
    let arr'' := heapify i arr' i 0 in
    if Nat.eqb i 1 then arr'' else sort_loop f arr'' n (i - 1)
  end.

Definition heapsort (l : list nat) : list nat :=
  let n := length l in
  let heap := build_heap_loop n l n (n / 2 - 1) in
  sort_loop n heap n (n - 1).

Compute heapsort [12; 11; 13; 5; 6; 7].
