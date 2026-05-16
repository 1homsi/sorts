\begin{code}
module Quicksort where

{-@ LIQUID "--no-termination" @-}

{-@ quicksort :: xs:[Int] -> {ys:[Int] | len ys = len xs} @-}
quicksort :: [Int] -> [Int]
quicksort [] = []
quicksort (pivot:rest) =
    quicksort [x | x <- rest, x <= pivot]
    ++ [pivot] ++
    quicksort [x | x <- rest, x > pivot]

main :: IO ()
main = print (quicksort [3, 6, 8, 10, 1, 2, 1])
\end{code}
