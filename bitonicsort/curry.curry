import List (splitAt)

bitonicMerge :: Bool -> [Int] -> [Int]
bitonicMerge _ [] = []
bitonicMerge _ [x] = [x]
bitonicMerge dir xs =
    let n = length xs
        k = n `div` 2
        (left, right) = splitAt k xs
        paired = zipWith (\a b -> if dir == (a > b) then (b, a) else (a, b)) left right
        newLeft = map fst paired
        newRight = map snd paired
    in bitonicMerge dir newLeft ++ bitonicMerge dir newRight

bitonicSort :: Bool -> [Int] -> [Int]
bitonicSort _ [] = []
bitonicSort _ [x] = [x]
bitonicSort dir xs =
    let n = length xs
        k = n `div` 2
        (left, right) = splitAt k xs
        sl = bitonicSort True left
        sr = bitonicSort False right
    in bitonicMerge dir (sl ++ sr)

main :: IO ()
main = print (bitonicSort True [3, 7, 4, 8, 6, 2, 1, 5])
