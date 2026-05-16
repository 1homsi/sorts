import Data.List (intercalate)

minRun :: Int
minRun = 32

insertionSort :: [Int] -> [Int]
insertionSort [] = []
insertionSort (x:xs) = insert x (insertionSort xs)
  where
    insert v [] = [v]
    insert v (y:ys)
      | v <= y    = v : y : ys
      | otherwise = y : insert v ys

mergeRuns :: [Int] -> [Int] -> [Int]
mergeRuns [] ys = ys
mergeRuns xs [] = xs
mergeRuns (x:xs) (y:ys)
  | x <= y    = x : mergeRuns xs (y:ys)
  | otherwise = y : mergeRuns (x:xs) ys

chunksOf :: Int -> [a] -> [[a]]
chunksOf _ [] = []
chunksOf n xs = take n xs : chunksOf n (drop n xs)

mergePairs :: [[Int]] -> [[Int]]
mergePairs [] = []
mergePairs [x] = [x]
mergePairs (x:y:rest) = mergeRuns x y : mergePairs rest

mergeAll :: [[Int]] -> [Int]
mergeAll [x] = x
mergeAll xs = mergeAll (mergePairs xs)

timsort :: [Int] -> [Int]
timsort [] = []
timsort xs = mergeAll (map insertionSort (chunksOf minRun xs))

main :: IO ()
main = print (timsort [5, 2, 8, 1, 9, 3, 7, 4, 6])
