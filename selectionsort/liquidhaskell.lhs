{-@ LIQUID "--no-termination" @-}
module SelectionSort where

{-@ selectionSort :: [Int] -> [Int] @-}
selectionSort :: [Int] -> [Int]
selectionSort [] = []
selectionSort xs =
    let m = minimum xs
        rest = removeFirst m xs
    in m : selectionSort rest

removeFirst :: Int -> [Int] -> [Int]
removeFirst _ [] = []
removeFirst x (y:ys)
    | x == y    = ys
    | otherwise = y : removeFirst x ys
