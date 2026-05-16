module SelectionSort

import StdEnv

selectionSort :: [Int] -> [Int]
selectionSort [] = []
selectionSort xs
    # m = foldl1 min xs
    # rest = removeFirst m xs
    = [m : selectionSort rest]

removeFirst :: Int [Int] -> [Int]
removeFirst _ [] = []
removeFirst x [y:ys]
    | x == y = ys
    | otherwise = [y : removeFirst x ys]

Start :: [Int]
Start = selectionSort [5,3,1,4,2]
