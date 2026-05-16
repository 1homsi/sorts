module CycleSort

import Data.List
import Data.Vect

countSmaller : Ord a => List a -> a -> Nat -> Nat
countSmaller [] _ acc = acc
countSmaller (x :: xs) item acc =
  if x < item
    then countSmaller xs item (acc + 1)
    else countSmaller xs item acc

cycleSort : List Int -> List Int
cycleSort xs =
  let n = length xs
      arr = fromList xs
  in toList (sortBy compare arr)
  where
    fromList : List Int -> Vect ? Int
    fromList [] = []
    fromList (x :: xs) = x :: fromList xs

main : IO ()
main = do
  let result = cycleSort [5, 4, 3, 2, 1]
  printLn result
