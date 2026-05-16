Require Import List.
Require Import Arith.

Fixpoint pass (arr : list nat) (gap : nat) (i : nat) : list nat * bool :=
  match i with
  | 0 => (arr, false)
  | S i' =>
    match pass arr gap i' with
    | (arr', changed) =>
      let j := i' + gap in
      match nth_error arr' i', nth_error arr' j with
      | Some a, Some b =>
        if Nat.ltb b a then
          (arr', true)
        else
          (arr', changed)
      | _, _ => (arr', changed)
      end
    end
  end.

Definition new_gap (gap : nat) : nat :=
  Nat.max 1 (Nat.div gap 13 * 10).

Fixpoint comb_sort_loop (arr : list nat) (gap : nat) (fuel : nat) : list nat :=
  match fuel with
  | 0 => arr
  | S fuel' =>
    let g := new_gap gap in
    match pass arr g (length arr) with
    | (arr', _) =>
      if Nat.eqb g 1 then arr'
      else comb_sort_loop arr' g fuel'
    end
  end.

Definition comb_sort (arr : list nat) : list nat :=
  comb_sort_loop arr (length arr) (length arr * 10).
