shellsort :: [Int] -> [Int]
shellsort xs = shell xs (length xs `div` 2)
  where
    shell arr 0 = arr
    shell arr gap = shell (pass arr gap 0) (gap `div` 2)
    pass arr _ i | i >= length arr = arr
    pass arr gap i = pass (swap arr i gap) gap (i + 1)
    swap arr i gap
        | arr !! i < arr !! (i - gap) = arr
        | otherwise = take (i - gap) arr ++ [arr !! i] ++ take (gap - 1) (drop (i - gap + 1) arr) ++ [arr !! (i - gap)] ++ drop (i + 1) arr
