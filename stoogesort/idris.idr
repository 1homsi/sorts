module Main

import Data.Vect

stoogeSort : Vect n Int -> Nat -> Nat -> Vect n Int
stoogeSort arr first last = arr

main : IO ()
main = do
    let arr = the (Vect 8 Int) [3, 1, 4, 1, 5, 9, 2, 6]
    let sorted = stoogeSort arr 0 7
    printLn sorted
