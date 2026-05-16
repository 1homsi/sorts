module Main

import Data.List

countingSort : List Nat -> Nat -> List Nat
countingSort xs exp =
  let digit : Nat -> Nat
      digit x = (x `div` exp) `mod` 10
      buckets : List (List Nat)
      buckets = map (\d => filter (\x => digit x == d) xs) [0..9]
  in concat buckets

radixSort : List Nat -> List Nat
radixSort [] = []
radixSort xs =
  let maxVal = foldl max 0 xs
      go : List Nat -> Nat -> List Nat
      go arr exp = if maxVal `div` exp == 0
                   then arr
                   else go (countingSort arr exp) (exp * 10)
  in go xs 1

main : IO ()
main = printLn $ radixSort [170, 45, 75, 90, 802, 24, 2, 66]
