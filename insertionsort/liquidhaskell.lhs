{-@ LIQUID "--no-totality" @-}
module InsertionSort where

{-@ insert :: x:Int -> xs:[Int] -> [Int] @-}
insert :: Int -> [Int] -> [Int]
insert x [] = [x]
insert x (y:ys)
  | x <= y    = x : y : ys
  | otherwise = y : insert x ys

{-@ insertionSort :: [Int] -> [Int] @-}
insertionSort :: [Int] -> [Int]
insertionSort [] = []
insertionSort (x:xs) = insert x (insertionSort xs)
