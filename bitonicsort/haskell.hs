import Data.List (splitAt)

bitonicMerge :: Ord a => Bool -> [a] -> [a]
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

bitonicSort :: Ord a => Bool -> [a] -> [a]
bitonicSort _ [] = []
bitonicSort _ [x] = [x]
bitonicSort dir xs =
    let n = length xs
        k = n `div` 2
        (left, right) = splitAt k xs
        sortedLeft = bitonicSort True left
        sortedRight = bitonicSort False right
    in bitonicMerge dir (sortedLeft ++ sortedRight)

main :: IO ()
main = do
    let data_ = [3, 7, 4, 8, 6, 2, 1, 5] :: [Int]
    print (bitonicSort True data_)
