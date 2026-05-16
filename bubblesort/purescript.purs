module Main where

import Prelude
import Data.Array (length, unsafeIndex)
import Effect (Effect)
import Effect.Console (log)
import Data.Array.ST (run, thaw, STArray)
import Data.Array.ST as STA
import Control.Monad.ST (for)

bubbleSort :: Array Int -> Array Int
bubbleSort arr = run do
  a <- thaw arr
  let n = length arr
  let loop end = when (end > 1) do
        swapped <- STA.new
        for 0 (end - 1) \i -> do
          xi <- STA.peek i a
          xi1 <- STA.peek (i+1) a
          case xi, xi1 of
            Just x, Just y | x > y -> do
              _ <- STA.poke i y a
              _ <- STA.poke (i+1) x a
              pure unit
            _, _ -> pure unit
        loop (end - 1)
  loop n
  pure a

main :: Effect Unit
main = log $ show $ bubbleSort [64, 34, 25, 12, 22, 11, 90]
