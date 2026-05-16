module Main where

import Prelude
import Data.Array (foldl, length, range, filter, concat, updateAt, replicate, (!!))
import Data.Maybe (fromMaybe)
import Effect (Effect)
import Effect.Console (log)
import Data.Show (show)

getDigit :: Int -> Int -> Int
getDigit x exp = (x / exp) `mod` 10

countingSort :: Array Int -> Int -> Array Int
countingSort arr exp =
  let buckets = map (\d -> filter (\x -> getDigit x exp == d) arr) (range 0 9)
  in concat buckets

radixSort :: Array Int -> Array Int
radixSort [] = []
radixSort arr =
  let maxVal = foldl max 0 arr
      go xs exp =
        if maxVal / exp == 0 then xs
        else go (countingSort xs exp) (exp * 10)
  in go arr 1

main :: Effect Unit
main = log $ show $ radixSort [170, 45, 75, 90, 802, 24, 2, 66]
