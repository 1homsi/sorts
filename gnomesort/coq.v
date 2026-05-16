Require Import List.
Require Import Arith.

Fixpoint insert_gnome (x : nat) (l : list nat) : list nat :=
  match l with
  | nil => x :: nil
  | h :: t => if Nat.leb x h then x :: h :: t
              else h :: insert_gnome x t
  end.

Fixpoint gnome_sort (l : list nat) : list nat :=
  match l with
  | nil => nil
  | h :: t => insert_gnome h (gnome_sort t)
  end.
