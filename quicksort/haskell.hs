quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
  quicksort [y | y <- xs, y <= x] ++ [x] ++ quicksort [y | y <- xs, y > x]

main :: IO ()
main = print (quicksort [3, 6, 8, 10, 1, 2, 1 :: Int])
