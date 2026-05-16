module heapsort where

open import Data.Nat using (ℕ; zero; suc; _+_; _*_; _<_; _≤_)
open import Data.Vec using (Vec; _[_]≔_; lookup)
open import Data.Fin using (Fin; fromℕ<)
open import Relation.Nullary using (yes; no)
open import Data.Nat.Properties using (<-trans)

HeapArr : ℕ → Set
HeapArr n = Vec ℕ n

swap : {n : ℕ} → HeapArr n → Fin n → Fin n → HeapArr n
swap arr i j =
  let vi = lookup arr i
      vj = lookup arr j
  in arr [ i ]≔ vj [ j ]≔ vi

heapsort-spec : {n : ℕ} → HeapArr n → HeapArr n
heapsort-spec arr = arr
