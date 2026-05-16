module CombSort where

import Prelude
import Data.Array (length, unsafeIndex, updateAt)
import Data.Maybe (fromMaybe)
import Effect (Effect)
import Data.Int (floor, toNumber)

combSort :: Array Int -> Array Int
combSort arr = go arr (length arr)
  where
    go :: Array Int -> Int -> Array Int
    go a gap =
      let g = max 1 (floor (toNumber gap / 1.3))
          (a', changed) = pass a g 0 false
      in if g == 1 && not changed then a'
         else go a' g

    pass :: Array Int -> Int -> Int -> Boolean -> (Array Int × Boolean)
    pass a gap i changed
      | i + gap >= length a = Tuple a changed
      | otherwise =
          let ai = unsafeIndex a i
              aj = unsafeIndex a (i + gap)
          in if ai > aj
             then pass (fromMaybe a (updateAt i aj a >>= updateAt (i + gap) ai)) gap (i + 1) true
             else pass a gap (i + 1) changed
