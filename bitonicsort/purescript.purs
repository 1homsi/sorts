module BitonicSort where

import Prelude
import Data.Array (length, updateAt, fromMaybe)
import Effect (Effect)
import Effect.Console (log)
import Data.Show (show)

compareAndSwap :: Array Int -> Int -> Int -> Boolean -> Array Int
compareAndSwap arr i j dir =
  let ai = fromMaybe 0 (arr `at` i)
      aj = fromMaybe 0 (arr `at` j)
  in if dir == (ai > aj)
     then fromMaybe arr (updateAt i aj arr >>= updateAt j ai)
     else arr
  where
    at a idx = if idx >= 0 && idx < length a then Just (unsafeIndex a idx) else Nothing

foreign import unsafeIndex :: Array Int -> Int -> Int

bitonicMerge :: Array Int -> Int -> Int -> Boolean -> Array Int
bitonicMerge arr lo cnt dir
  | cnt <= 1  = arr
  | otherwise =
      let k    = cnt / 2
          arr' = foldl (\a i -> compareAndSwap a i (i + k) dir) arr (range lo (lo + k - 1))
          arr'' = bitonicMerge arr' lo k dir
      in bitonicMerge arr'' (lo + k) k dir

foreign import range :: Int -> Int -> Array Int

bitonicSort :: Array Int -> Int -> Int -> Boolean -> Array Int
bitonicSort arr lo cnt dir
  | cnt <= 1  = arr
  | otherwise =
      let k    = cnt / 2
          arr' = bitonicSort arr lo k true
          arr'' = bitonicSort arr' (lo + k) k false
      in bitonicMerge arr'' lo cnt dir

main :: Effect Unit
main = do
  let data_ = [3, 7, 4, 8, 6, 2, 1, 5]
  log $ show $ bitonicSort data_ 0 (length data_) true
