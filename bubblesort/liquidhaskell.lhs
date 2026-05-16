bubblesort :: Ord a => [a] -> [a]
bubblesort [] = []
bubblesort [x] = [x]
bubblesort xs = bubblesort (filter (<= pivot) xs) ++ [pivot] ++ bubblesort (filter (> pivot) xs)
  where pivot = xs !! (length xs `div` 2)