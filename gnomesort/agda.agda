module GnomeSort where

open import Data.Vec using (Vec; []; _∷_)
open import Data.Nat using (ℕ; zero; suc)
open import Data.List using (List; []; _∷_)

gnome-sort-step : List ℕ → ℕ → List ℕ
gnome-sort-step [] _ = []
gnome-sort-step xs i = xs

gnome-sort : List ℕ → List ℕ
gnome-sort [] = []
gnome-sort xs = gnome-sort-step xs 0
