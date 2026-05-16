module BubbleSort

import StdEnv

bubblePass :: [Int] -> ([Int], Bool)
bubblePass [] = ([], False)
bubblePass [x] = ([x], False)
bubblePass [x,y:rest]
    | x > y    = let (sorted, _) = bubblePass [x:rest] in ([y:sorted], True)
    | otherwise = let (sorted, sw) = bubblePass [y:rest] in ([x:sorted], sw)

bubbleSort :: [Int] -> [Int]
bubbleSort xs
    # (sorted, swapped) = bubblePass xs
    | swapped   = bubbleSort sorted
    | otherwise = sorted

Start :: *World -> *World
Start world
    # sorted = bubbleSort [64, 34, 25, 12, 22, 11, 90]
    = snd (foldl (\(w,_) x -> (w, toString x)) (world, "") sorted)
