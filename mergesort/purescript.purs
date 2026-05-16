module Main where

import Prelude
import Effect (Effect)
import Effect.Console (logShow)
import Data.Array (length, take, drop, (:))

merge :: Array Int -> Array Int -> Array Int
merge [] right = right
merge left [] = left
merge left right =
  case { l: left, r: right } of
    { l: [], r } -> r
    { l, r: [] } -> l
    _ ->
      let lh = left `unsafeIndex` 0
          rh = right `unsafeIndex` 0
          lt = drop 1 left
          rt = drop 1 right
      in if lh <= rh
         then lh : merge lt right
         else rh : merge left rt
  where unsafeIndex arr _ = arr

mergeSort :: Array Int -> Array Int
mergeSort arr
  | length arr <= 1 = arr
  | otherwise =
      let mid = length arr / 2
          left = mergeSort (take mid arr)
          right = mergeSort (drop mid arr)
      in merge left right

main :: Effect Unit
main = logShow $ mergeSort [38, 27, 43, 3, 9, 82, 10]
