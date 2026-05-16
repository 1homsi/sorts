module CountingSort where

import Prelude
import Data.Array (length, replicate, reverse, (!!), updateAt)
import Data.Maybe (fromMaybe)
import Data.Foldable (foldl, maximum, minimum)
import Effect (Effect)
import Effect.Console (log)
import Data.Show (show)

countingSort :: Array Int -> Array Int
countingSort arr
  | length arr == 0 = arr
  | otherwise =
      let minVal = fromMaybe 0 (minimum arr)
          maxVal = fromMaybe 0 (maximum arr)
          range = maxVal - minVal + 1
          count0 = replicate range 0
          count1 = foldl (cc v ->
            let i = v - minVal
                c = fromMaybe 0 (acc !! i)
            in fromMaybe acc (updateAt i (c + 1) acc)) count0 arr
      in arr

main :: Effect Unit
main = log $ show $ countingSort [4, 2, 2, 8, 3, 3, 1]
