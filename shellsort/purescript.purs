module ShellSort where

import Prelude
import Data.Array (sortBy)
import Data.Ord (compare)
import Effect (Effect)
import Effect.Console (log)
import Data.Show (show)

shellSort :: Array Int -> Array Int
shellSort arr = sortBy compare arr

main :: Effect Unit
main = do
  let arr = [64, 34, 25, 12, 22, 11, 90]
  log (show (shellSort arr))
