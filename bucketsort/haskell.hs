import Data.List (sortBy)
import Data.Ord (comparing)

insertionSort :: [Double] -> [Double]
insertionSort [] = []
insertionSort (x:xs) = insert x (insertionSort xs)
  where
    insert v [] = [v]
    insert v (y:ys)
      | v <= y    = v : y : ys
      | otherwise = y : insert v ys

bucketSort :: [Double] -> [Double]
bucketSort [] = []
bucketSort arr =
  let n = length arr
      minV = minimum arr
      maxV = maximum arr
      getIdx x = min (n - 1) (floor ((x - minV) / (maxV - minV + 1) * fromIntegral n))
      buckets = [ filter (\x -> getIdx x == i) arr | i <- [0..n-1] ]
  in concatMap insertionSort buckets

main :: IO ()
main = print $ bucketSort [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
