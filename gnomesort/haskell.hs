import Data.List (splitAt)

gnomeSort :: Ord a => [a] -> [a]
gnomeSort [] = []
gnomeSort xs = go xs 0
  where
    arr = xs
    go lst i
      | i >= length lst = lst
      | i == 0 || lst !! i >= lst !! (i - 1) = go lst (i + 1)
      | otherwise =
          let (pre, a:b:post) = splitAt (i - 1) lst
          in go (pre ++ [a, b] ++ post) (i - 1)
