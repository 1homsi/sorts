Require Import List.
Import ListNotations.

Fixpoint quicksort (l : list nat) : list nat :=
  match l with
  | [] => []
  | pivot :: rest =>
      let left := filter (fun x => Nat.leb x pivot) rest in
      let right := filter (fun x => negb (Nat.leb x pivot)) rest in
      quicksort left ++ [pivot] ++ quicksort right
  end.

Compute quicksort [3; 6; 8; 10; 1; 2; 1].
