module SelectionSort where

open import Data.List using (List; []; _∷_; minimum)
open import Data.Nat using (ℕ)

removeFirst : ℕ → List ℕ → List ℕ
removeFirst _ [] = []
removeFirst x (y ∷ ys) with x Data.Nat.≟ y
... | yes _ = ys
... | no  _ = y ∷ removeFirst x ys

selectionSort : List ℕ → List ℕ
selectionSort [] = []
selectionSort xs =
  let m = minimum xs
  in m ∷ selectionSort (removeFirst m xs)
