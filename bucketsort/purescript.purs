module BucketSort where

import Prelude
import Data.Array (concat, length, replicate, updateAt)
import Data.Maybe (fromMaybe)
import Data.Int (floor, toNumber)
import Effect (Effect)
import Effect.Console (log)
import Data.Show (show)

insertSorted :: Number -> Array Number -> Array Number
insertSorted x [] = [x]
insertSorted x arr = case arr of
  [] -> [x]
  _ -> if x <= (fromMaybe 0.0 (arr !! 0))
       then [x] <> arr
       else (fromMaybe [] (arr !! 0 >>= \h -> pure [h])) <>
            insertSorted x (fromMaybe [] (tail arr))

insertionSort :: Array Number -> Array Number
insertionSort [] = []
insertionSort arr = case uncons arr of
  Nothing -> []
  Just {head: h, tail: t} -> insertSorted h (insertionSort t)

bucketSort :: Array Number -> Array Number
bucketSort arr
  | length arr == 0 = arr
  | otherwise =
    let n = length arr
        mn = foldl min (fromMaybe 0.0 (arr !! 0)) arr
        mx = foldl max (fromMaybe 0.0 (arr !! 0)) arr
        getIdx num = min (n - 1) (floor ((num - mn) / (mx - mn + 1.0) * toNumber n))
        buckets = foldl (\bs x ->
          let idx = getIdx x
              old = fromMaybe [] (bs !! idx)
          in fromMaybe bs (updateAt idx (old <> [x]) bs))
          (replicate n []) arr
    in concat (map insertionSort buckets)

main :: Effect Unit
main = log $ show $ bucketSort [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
