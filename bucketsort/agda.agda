module BucketSort where

open import Data.List using (List; []; _∷_; _++_; length; map; concatMap)
open import Data.Nat using (ℕ; zero; suc; _+_; _∸_)
open import Data.Float using (Float; _<_; _≤_)

insertSorted : Float → List Float → List Float
insertSorted x [] = x ∷ []
insertSorted x (h ∷ t) with x ≤ h
... | true  = x ∷ h ∷ t
... | false = h ∷ insertSorted x t

insertionSort : List Float → List Float
insertionSort [] = []
insertionSort (h ∷ t) = insertSorted h (insertionSort t)

getIdx : Float → Float → Float → ℕ → ℕ
getIdx num mn mx n = {!!}

bucketSort : List Float → List Float
bucketSort [] = []
bucketSort arr = concatMap insertionSort (distributeIntoBuckets arr)
  where
    distributeIntoBuckets : List Float → List (List Float)
    distributeIntoBuckets xs = {!!}

_ : insertionSort (0.78 ∷ 0.17 ∷ 0.39 ∷ []) ≡ (0.17 ∷ 0.39 ∷ 0.78 ∷ [])
_ = {!!}
