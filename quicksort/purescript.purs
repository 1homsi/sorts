module Main where

import Prelude
import Data.Array (filter)
import Effect (Effect)
import Effect.Console (logShow)

quicksort :: Array Int -> Array Int
quicksort arr
  | arr == [] = []
  | otherwise =
      let pivot = arr `unsafeIndex` (length arr `div` 2)
          left = filter (_ < pivot) arr
          middle = filter (_ == pivot) arr
          right = filter (_ > pivot) arr
      in quicksort left <> middle <> quicksort right

main :: Effect Unit
main = logShow (quicksort [3, 6, 8, 10, 1, 2, 1])
