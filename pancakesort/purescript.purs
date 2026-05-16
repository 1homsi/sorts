module PancakeSort where

import Prelude
import Data.Array (length, (!!), updateAt, reverse, take, drop, fromMaybe)
import Effect (Effect)
import Effect.Console (logShow)

flipArr :: Array Int -> Int -> Array Int
flipArr arr k = reverse (take (k + 1) arr) <> drop (k + 1) arr

findMaxIdx :: Array Int -> Int -> Int
findMaxIdx arr size =
  let go i maxIdx
        | i >= size = maxIdx
        | otherwise =
            let vi = fromMaybe 0 (arr !! i)
                vm = fromMaybe 0 (arr !! maxIdx)
            in go (i + 1) (if vi > vm then i else maxIdx)
  in go 1 0

pancakeSort :: Array Int -> Array Int
pancakeSort arr = go arr (length arr)
  where
    go a size
      | size <= 1 = a
      | otherwise =
          let maxIdx = findMaxIdx a size
              a1 = if maxIdx /= 0 then flipArr a maxIdx else a
              a2 = flipArr a1 (size - 1)
          in go a2 (size - 1)

main :: Effect Unit
main = logShow (pancakeSort [3, 6, 2, 7, 4, 1, 5])
