module BubbleSort where

open import Data.Nat
open import Data.Vec using (Vec; []; _∷_)
open import Data.Bool

bubblePass : ∀ {n} → Vec ℕ n → Vec ℕ n × Bool
bubblePass [] = [] , false
bubblePass (x ∷ []) = (x ∷ []) , false
bubblePass (x ∷ y ∷ rest) with x ≤? y
... | yes _ = let (sorted , sw) = bubblePass (y ∷ rest) in (x ∷ sorted) , sw
... | no  _ = let (sorted , _)  = bubblePass (x ∷ rest) in (y ∷ sorted) , true

{-# TERMINATING #-}
bubbleSort : ∀ {n} → Vec ℕ n → Vec ℕ n
bubbleSort xs with bubblePass xs
... | sorted , false = sorted
... | sorted , true  = bubbleSort sorted
