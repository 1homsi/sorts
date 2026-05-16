module TimSort where

open import Data.List using (List; []; _∷_; _++_; length; take; drop)
open import Data.Nat using (ℕ; zero; suc; _+_; _*_; _≤?_; _<_)
open import Data.Bool using (Bool; true; false; if_then_else_)
open import Relation.Nullary using (yes; no)

insert : ℕ → List ℕ → List ℕ
insert x [] = x ∷ []
insert x (y ∷ ys) with x ≤? y
... | yes _ = x ∷ y ∷ ys
... | no  _ = y ∷ insert x ys

insertionSort : List ℕ → List ℕ
insertionSort [] = []
insertionSort (x ∷ xs) = insert x (insertionSort xs)

merge : List ℕ → List ℕ → List ℕ
merge [] ys = ys
merge xs [] = xs
merge (x ∷ xs) (y ∷ ys) with x ≤? y
... | yes _ = x ∷ merge xs (y ∷ ys)
... | no  _ = y ∷ merge (x ∷ xs) ys

chunksOf : ℕ → List ℕ → List (List ℕ)
chunksOf zero _ = []
chunksOf _ [] = []
chunksOf n xs = take n xs ∷ chunksOf n (drop n xs)

mergePairs : List (List ℕ) → List (List ℕ)
mergePairs [] = []
mergePairs (x ∷ []) = x ∷ []
mergePairs (x ∷ y ∷ rest) = merge x y ∷ mergePairs rest

mergeAll : List (List ℕ) → List ℕ
mergeAll [] = []
mergeAll (x ∷ []) = x
mergeAll xs = mergeAll (mergePairs xs)

timsort : List ℕ → List ℕ
timsort [] = []
timsort xs = mergeAll (Data.List.map insertionSort (chunksOf 32 xs))
  where open import Data.List using (map)
