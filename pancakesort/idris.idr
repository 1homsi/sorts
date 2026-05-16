module PancakeSort

import Data.List

flipList : List Int -> Nat -> List Int
flipList xs k =
  let (front, back) = splitAt (k + 1) xs
  in (reverse front) ++ back

findMaxIdx : List Int -> Nat -> Nat
findMaxIdx xs size =
  let sub = take size xs
      maxVal = foldl max 0 sub
  in case findIndex (== maxVal) sub of
       Just i => i
       Nothing => 0

pancakeSort : List Int -> Nat -> List Int
pancakeSort xs 0 = xs
pancakeSort xs 1 = xs
pancakeSort xs size =
  let maxIdx = findMaxIdx xs size
      xs1 = if maxIdx /= 0 then flipList xs maxIdx else xs
      xs2 = flipList xs1 (size - 1)
  in pancakeSort xs2 (size - 1)

sort : List Int -> List Int
sort xs = pancakeSort xs (length xs)

main : IO ()
main = printLn $ sort [3, 6, 2, 7, 4, 1, 5]
