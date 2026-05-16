module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Data.Show (show)

data Tree a = Leaf | Node (Tree a) a (Tree a)

insert :: forall a. Ord a => Tree a -> a -> Tree a
insert Leaf v = Node Leaf v Leaf
insert (Node l x r) v
  | v < x    = Node (insert l v) x r
  | otherwise = Node l x (insert r v)

inorder :: forall a. Tree a -> Array a
inorder Leaf = []
inorder (Node l v r) = inorder l <> [v] <> inorder r

treesort :: forall a. Ord a => Array a -> Array a
treesort arr = inorder (foldl insert Leaf arr)
  where
    foldl f z [] = z
    foldl f z (x:xs) = foldl f (f z x) xs

main :: Effect Unit
main = log $ show $ treesort [5, 3, 7, 1, 4, 6, 8 :: Int]
