import Data.List (sortBy, foldl')
import Data.Ord (comparing)

countingSort :: [Int] -> Int -> [Int]
countingSort arr exp =
    let digit x = (x `div` exp) `mod` 10
        buckets = foldl' (\bs x -> let d = digit x in take d bs ++ [bs !! d ++ [x]] ++ drop (d+1) bs) (replicate 10 []) arr
    in concat buckets

radixSort :: [Int] -> [Int]
radixSort [] = []
radixSort arr =
    let maxVal = maximum arr
        exps = takeWhile (\e -> maxVal `div` e > 0) (iterate (*10) 1)
    in foldl' countingSort arr exps

main :: IO ()
main = print $ radixSort [170, 45, 75, 90, 802, 24, 2, 66]
