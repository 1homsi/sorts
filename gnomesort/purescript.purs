module GnomeSort where

import Data.Array (length, unsafeIndex, updateAt)
import Data.Maybe (fromMaybe)

gnomeSort :: Array Int -> Array Int
gnomeSort arr = go arr 0
  where
    n = length arr
    go a i
      | i >= n = a
      | i == 0 || unsafeIndex a i >= unsafeIndex a (i - 1) = go a (i + 1)
      | otherwise =
          let x = unsafeIndex a i
              y = unsafeIndex a (i - 1)
              a' = fromMaybe a (updateAt i y a >>= updateAt (i - 1) x)
          in go a' (i - 1)
