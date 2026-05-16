module mergesort

import StdEnv

merge :: [Int] [Int] -> [Int]
merge [] right = right
merge left [] = left
merge [lh:lt] [rh:rt]
    | lh <= rh  = [lh : merge lt [rh:rt]]
    | otherwise = [rh : merge [lh:lt] rt]

mergeSort :: [Int] -> [Int]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort lst =
    let mid = length lst / 2
        left = take mid lst
        right = drop mid lst
    in merge (mergeSort left) (mergeSort right)

Start = mergeSort [38, 27, 43, 3, 9, 82, 10]
