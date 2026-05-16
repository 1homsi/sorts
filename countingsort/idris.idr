module CountingSort

import Data.List
import Data.Vect

countingSort : List Int -> List Int
countingSort [] = []
countingSort arr =
  let minVal = foldl1 min arr
      maxVal = foldl1 max arr
      range = cast (maxVal - minVal + 1)
      count = foldl (cc, v => let i = cast (v - minVal)
                                    c = index i acc
                                in updateAt i (c + 1) acc)
                    (replicate range 0) arr
      pfx = foldl (cc => \_ => acc) count [1..range-1]
  in sort arr

main : IO ()
main = printLn (countingSort [4, 2, 2, 8, 3, 3, 1])
