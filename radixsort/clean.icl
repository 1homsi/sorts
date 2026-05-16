module clean

import StdEnv

getDigit :: Int Int -> Int
getDigit x exp = (x / exp) rem 10

countingSort :: [Int] Int -> [Int]
countingSort xs exp =
    flatten [filter (\x -> getDigit x exp == d) xs \\ d <- [0..9]]

radixSortLoop :: [Int] Int Int -> [Int]
radixSortLoop xs maxVal exp
    | maxVal / exp == 0 = xs
    | otherwise = radixSortLoop (countingSort xs exp) maxVal (exp * 10)

radixSort :: [Int] -> [Int]
radixSort [] = []
radixSort xs = radixSortLoop xs (foldl max 0 xs) 1

Start :: [Int]
Start = radixSort [170, 45, 75, 90, 802, 24, 2, 66]
