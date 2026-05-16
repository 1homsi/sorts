Require Import List.
Require Import Coq.Reals.Reals.
Import ListNotations.

Fixpoint insert_sorted (x : R) (lst : list R) : list R :=
  match lst with
  | [] => [x]
  | h :: t => if Rle_dec x h then x :: h :: t else h :: insert_sorted x t
  end.

Fixpoint insertion_sort (lst : list R) : list R :=
  match lst with
  | [] => []
  | h :: t => insert_sorted h (insertion_sort t)
  end.

Definition get_bucket_idx (num mn mx : R) (n : nat) : nat :=
  let range := mx - mn + 1 in
  let raw := Z.to_nat (floor ((num - mn) / range * INR n)) in
  min (n - 1) raw.

Fixpoint fill_buckets (arr : list R) (mn mx : R) (n : nat)
                       (buckets : list (list R)) : list (list R) :=
  match arr with
  | [] => buckets
  | x :: rest =>
    let idx := get_bucket_idx x mn mx n in
    let updated := replace idx (x :: nth idx buckets []) buckets in
    fill_buckets rest mn mx n updated
  end.

Definition bucket_sort (arr : list R) : list R :=
  match arr with
  | [] => []
  | _ =>
    let n := length arr in
    let mn := fold_left Rmin arr (hd 0 arr) in
    let mx := fold_left Rmax arr (hd 0 arr) in
    let buckets := repeat [] n in
    let filled := fill_buckets arr mn mx n buckets in
    flat_map insertion_sort filled
  end.

Compute insertion_sort [0.78; 0.17; 0.39; 0.26; 0.72].
