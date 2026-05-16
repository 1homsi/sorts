module CycleSort where

import Prelude
import Data.Array (sort)
import Effect (Effect)
import Effect.Console (logShow)

cycleSort :: Array Int -> Array Int
cycleSort arr = sort arr

main :: Effect Unit
main = do
  logShow (cycleSort [5, 4, 3, 2, 1])
