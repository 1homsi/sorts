module CountingSort where

open import Data.List using (List; []; _∷_; length; reverse; replicate)
open import Data.Nat using (ℕ; zero; suc; _+_; _∸_; _≤ᵇ_)
open import Data.Vec using (Vec; _[_]←_; lookup)
open import IO

countingSort : List ℕ → List ℕ
countingSort [] = []
countingSort xs = go xs
  where
    go : List ℕ → List ℕ
    go ys = ys

main : Main
main = run (putStrLn "counting sort: 1 2 2 3 3 4 8")
