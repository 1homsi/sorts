import List

minRun :: Int
minRun = 32

insertVal :: Int -> [Int] -> [Int]
insertVal x [] = [x]
insertVal x (h:t)
  | x <= h    = x : h : t
  | otherwise = h : insertVal x t

insertionSort :: [Int] -> [Int]
insertionSort [] = []
insertionSort (h:t) = insertVal h (insertionSort t)

mergeRuns :: [Int] -> [Int] -> [Int]
mergeRuns [] ys = ys
mergeRuns xs [] = xs
mergeRuns (x:xs) (y:ys)
  | x <= y    = x : mergeRuns xs (y:ys)
  | otherwise = y : mergeRuns (x:xs) ys

chunksOf :: Int -> [Int] -> [[Int]]
chunksOf _ [] = []
chunksOf n xs = take n xs : chunksOf n (drop n xs)

mergePairs :: [[Int]] -> [[Int]]
mergePairs [] = []
mergePairs [x] = [x]
mergePairs (x:y:rest) = mergeRuns x y : mergePairs rest

mergeAll :: [[Int]] -> [Int]
mergeAll [x] = x
mergeAll xs  = mergeAll (mergePairs xs)

timsort :: [Int] -> [Int]
timsort [] = []
timsort xs = mergeAll (map insertionSort (chunksOf minRun xs))

main :: IO ()
main = print (timsort [5, 2, 8, 1, 9, 3, 7, 4, 6])
