import Data.List (maximumBy)
import Data.Ord (comparing)

flipArr :: [Int] -> Int -> [Int]
flipArr arr k = reverse (take (k+1) arr) ++ drop (k+1) arr

findMaxIdx :: [Int] -> Int -> Int
findMaxIdx arr size =
    snd $ maximum $ zip (take size arr) [0..]

pancakeSort :: [Int] -> [Int]
pancakeSort arr = go arr (length arr)
  where
    go a 1 = a
    go a size =
        let maxIdx = findMaxIdx a size
            a1 = if maxIdx /= 0 then flipArr a maxIdx else a
            a2 = flipArr a1 (size - 1)
        in go a2 (size - 1)

main :: IO ()
main = print $ pancakeSort [3, 6, 2, 7, 4, 1, 5]
