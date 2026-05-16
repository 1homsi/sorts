import Data.List (splitAt)

gnomeSort :: Ord a => [a] -> [a]
gnomeSort xs = go (elems arr) 0
  where
    arr = xs
    go lst i
      | i >= length lst = lst
      | i == 0 || lst !! i >= lst !! (i-1) = go lst (i+1)
      | otherwise =
          let (a, x:y:b) = splitAt (i-1) lst
          in go (a ++ y:x:b) (i-1)
    elems x = x
