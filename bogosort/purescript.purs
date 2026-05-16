module Main where

import Prelude
import Data.Array (zipWith, drop, length, (!!))
import Effect (Effect)
import Effect.Console (logShow)
import Effect.Random (randomInt)

isSorted :: Array Int -> Boolean
isSorted arr =
  let pairs = zipWith (\a b -> a <= b) arr (drop 1 arr)
  in and pairs

foreign import shuffleImpl :: Array Int -> Effect (Array Int)

bogosort :: Array Int -> Effect (Array Int)
bogosort arr = do
  sorted <- pure (isSorted arr)
  if sorted
    then pure arr
    else do
      shuffled <- shuffleImpl arr
      bogosort shuffled

main :: Effect Unit
main = do
  result <- bogosort [3, 1, 4, 1, 5, 9, 2, 6]
  logShow result
