import Data.List (foldl')

cocktailSort :: Ord a => [a] -> [a]
cocktailSort [] = []
cocktailSort xs = go xs True 0 (length xs - 1)
  where
    go arr False _ _ = arr
    go arr True s e =
      let (arr', swapped1) = forwardPass arr s e False
          (arr'', swapped2) = backwardPass arr' (s) (e - 1) False
      in if not swapped1 then arr'
         else go arr'' swapped2 (s + 1) (e - 1)
    forwardPass arr s e sw
      | s >= e = (arr, sw)
      | arr !! s > arr !! (s + 1) =
          let arr' = swap arr s (s + 1)
          in forwardPass arr' (s + 1) e True
      | otherwise = forwardPass arr (s + 1) e sw
    backwardPass arr s e sw
      | e <= s = (arr, sw)
      | arr !! e > arr !! (e + 1) =
          let arr' = swap arr e (e + 1)
          in backwardPass arr' s (e - 1) True
      | otherwise = backwardPass arr s (e - 1) sw
    swap arr i j =
      let a = arr !! i
          b = arr !! j
      in take i arr ++ [b] ++ take (j - i - 1) (drop (i + 1) arr) ++ [a] ++ drop (j + 1) arr
