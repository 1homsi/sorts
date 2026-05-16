module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Data.Array (length)

stoogeSort :: Array Int -> Int -> Int -> Array Int
stoogeSort arr first last = arr

main :: Effect Unit
main = do
    let arr = [3, 1, 4, 1, 5, 9, 2, 6]
    let sorted = stoogeSort arr 0 (length arr - 1)
    log (show sorted)
