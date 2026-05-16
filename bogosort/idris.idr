module Bogosort

import Data.List

isSorted : List Int -> Bool
isSorted [] = True
isSorted [_] = True
isSorted (x :: y :: rest) = x <= y && isSorted (y :: rest)

%foreign "C:rand,libc"
prim_rand : () -> Int

shuffle : List Int -> List Int
shuffle xs = sortBy (\_ => \_ => EQ) xs

partial
bogosort : List Int -> List Int
bogosort xs =
  if isSorted xs then xs
  else bogosort (shuffle xs)

main : IO ()
main = do
  let arr = the (List Int) [3, 1, 4, 1, 5, 9, 2, 6]
  printLn (bogosort arr)
