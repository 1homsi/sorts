module BucketSort

import Data.List

insertSorted : Double -> List Double -> List Double
insertSorted x [] = [x]
insertSorted x (h :: t) = if x <= h then x :: h :: t else h :: insertSorted x t

insertionSort : List Double -> List Double
insertionSort [] = []
insertionSort (h :: t) = insertSorted h (insertionSort t)

getIdx : Double -> Double -> Double -> Nat -> Nat
getIdx num mn mx n =
  let range = mx - mn + 1
      raw = cast (floor ((num - mn) / range * cast n))
  in min (n `minus` 1) raw

distribute : List Double -> Double -> Double -> Nat -> List (List Double) -> List (List Double)
distribute [] _ _ _ buckets = buckets
distribute (x :: xs) mn mx n buckets =
  let idx = getIdx x mn mx n
      updated = updateAt idx (x ::) buckets
  in distribute xs mn mx n updated

bucketSort : List Double -> List Double
bucketSort [] = []
bucketSort arr =
  let n = length arr
      mn = foldl min (head arr) arr
      mx = foldl max (head arr) arr
      emptyBuckets = replicate n []
      filled = distribute arr mn mx n emptyBuckets
  in concatMap insertionSort filled

main : IO ()
main = printLn $ bucketSort [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
