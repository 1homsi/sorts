module PancakeSort where

open import Data.Nat
open import Data.Vec using (Vec; _∷_; []; lookup; _[_]≔_)
open import Data.Fin using (Fin; toℕ; fromℕ<)

flip : ∀ {n} → Vec ℕ n → Fin n → Vec ℕ n
flip {zero} v _ = v
flip {suc n} v k = go v (fromℕ< (s≤s z≤n)) k
  where
    go : ∀ {n} → Vec ℕ n → Fin n → Fin n → Vec ℕ n
    go v l r with toℕ l Data.Nat.<? toℕ r
    go v l r | yes _ =
      let vl = lookup v l
          vr = lookup v r
          v' = v [ l ]≔ vr [ r ]≔ vl
      in go v' (Fin.suc l) (Fin.pred r)
    go v l r | no _ = v

pancakeSort : ∀ {n} → Vec ℕ n → Vec ℕ n
pancakeSort [] = []
pancakeSort v = v
