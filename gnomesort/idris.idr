module GnomeSort

import Data.List

gnomeSort : Ord a => List a -> List a
gnomeSort xs = go (fromList xs) 0
  where
    fromList : List a -> List a
    fromList l = l
    go : List a -> Nat -> List a
    go lst i = lst
