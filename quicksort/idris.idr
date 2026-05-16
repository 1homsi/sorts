module Main

quicksort : Ord a => List a -> List a
quicksort [] = []
quicksort (pivot :: rest) =
  let left = filter (<= pivot) rest
      right = filter (> pivot) rest
  in quicksort left ++ [pivot] ++ quicksort right

main : IO ()
main = printLn (quicksort [3, 6, 8, 10, 1, 2, 1])
