module treesort where

open import Data.Nat using (ℕ; _<ᵇ_)
open import Data.List using (List; []; _∷_; _++_)

data Tree : Set where
  leaf : Tree
  node : Tree → ℕ → Tree → Tree

insert : Tree → ℕ → Tree
insert leaf v = node leaf v leaf
insert (node l x r) v with v <ᵇ x
... | true  = node (insert l v) x r
... | false = node l x (insert r v)

inorder : Tree → List ℕ
inorder leaf = []
inorder (node l v r) = inorder l ++ (v ∷ []) ++ inorder r

treesort : List ℕ → List ℕ
treesort [] = []
treesort (x ∷ xs) = inorder (foldl insert leaf (x ∷ xs))
  where
    foldl : ∀ {A B : Set} → (B → A → B) → B → List A → B
    foldl f acc [] = acc
    foldl f acc (x ∷ xs) = foldl f (f acc x) xs
