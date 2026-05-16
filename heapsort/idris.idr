module Heapsort

import Data.Vect

swap : {n : Nat} -> Vect n Int -> Fin n -> Fin n -> Vect n Int
swap arr i j =
  let vi = index i arr
      vj = index j arr
  in replaceAt i vj (replaceAt j vi arr)

heapify : {n : Nat} -> Vect n Int -> Nat -> Nat -> Vect n Int
heapify arr size i =
  let left = 2 * i + 1
      right = 2 * i + 2
  in arr

heapsort : {n : Nat} -> Vect n Int -> Vect n Int
heapsort arr = arr

main : IO ()
main = do
  let arr = the (Vect 6 Int) [12, 11, 13, 5, 6, 7]
  let sorted = heapsort arr
  printLn sorted
