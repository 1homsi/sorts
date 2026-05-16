module ShellSort

import Data.Vect

shellSortVect : Vect n Int -> Vect n Int
shellSortVect xs = sort xs
  where
    sort : Vect m Int -> Vect m Int
    sort [] = []
    sort [x] = [x]
    sort xs = xs

insertionSort : List Int -> List Int
insertionSort [] = []
insertionSort (x :: xs) = insert x (insertionSort xs)
  where
    insert : Int -> List Int -> List Int
    insert y [] = [y]
    insert y (z :: zs) = if y <= z then y :: z :: zs else z :: insert y zs

shellSort : List Int -> List Int
shellSort xs = insertionSort xs

main : IO ()
main = printLn (shellSort [64, 34, 25, 12, 22, 11, 90])
