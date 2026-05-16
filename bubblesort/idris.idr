module BubbleSort

import Data.List

bubblePass : List Int -> (List Int, Bool)
bubblePass [] = ([], False)
bubblePass [x] = ([x], False)
bubblePass (x :: y :: rest) =
  if x > y
    then let (sorted, _) = bubblePass (x :: rest) in (y :: sorted, True)
    else let (sorted, sw) = bubblePass (y :: rest) in (x :: sorted, sw)

bubbleSort : List Int -> List Int
bubbleSort xs =
  let (sorted, swapped) = bubblePass xs
  in if swapped then bubbleSort sorted else sorted

main : IO ()
main = printLn $ bubbleSort [64, 34, 25, 12, 22, 11, 90]
