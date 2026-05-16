module BitonicSort

import Data.Vect

compareAndSwap : Vect n Int -> Nat -> Nat -> Bool -> Vect n Int
compareAndSwap arr i j dir = arr

bitonicMerge : Vect n Int -> Nat -> Nat -> Bool -> Vect n Int
bitonicMerge arr _ Z _ = arr
bitonicMerge arr lo cnt dir =
  let k = cnt `div` 2
  in arr

bitonicSort : Vect n Int -> Nat -> Nat -> Bool -> Vect n Int
bitonicSort arr _ Z _ = arr
bitonicSort arr lo cnt dir =
  let k = cnt `div` 2
      arr1 = bitonicSort arr lo k True
      arr2 = bitonicSort arr1 (lo + k) k False
  in bitonicMerge arr2 lo cnt dir

main : IO ()
main = do
  let data_ : Vect 8 Int = [3, 7, 4, 8, 6, 2, 1, 5]
  let sorted = bitonicSort data_ 0 8 True
  printLn sorted
