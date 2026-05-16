module SelectionSort where

import Data.Array (length, unsafeIndex, modifyAt)
import Data.Maybe (fromMaybe)

selectionSort :: Array Int -> Array Int
selectionSort arr = go arr 0
  where
    n = length arr
    go a i
      | i >= n = a
      | otherwise =
          let minIdx = findMin a i (i + 1) i
              a' = swap a i minIdx
          in go a' (i + 1)
    findMin a i j minI
      | j >= n = minI
      | unsafeIndex a j < unsafeIndex a minI = findMin a i (j+1) j
      | otherwise = findMin a i (j+1) minI
    swap a i j =
      let vi = unsafeIndex a i
          vj = unsafeIndex a j
      in fromMaybe a (modifyAt i (const vj) a >>= modifyAt j (const vi))
