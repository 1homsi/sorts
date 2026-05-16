radixSort :: [Int] -> [Int]
radixSort [] = []
radixSort arr = radixSortHelper arr 1 (maximum arr)

radixSortHelper :: [Int] -> Int -> Int -> [Int]
radixSortHelper arr exp maxVal
    | exp > maxVal = arr
    | otherwise = radixSortHelper (countingSort arr exp) (exp * 10) maxVal

countingSort :: [Int] -> Int -> [Int]
countingSort arr exp =
    let n = length arr
        count = replicate 10 0
        indexed = map (\x -> (x, (x `div` exp) `mod` 10)) arr
    in reconstructArray (updateCounts indexed count) arr exp