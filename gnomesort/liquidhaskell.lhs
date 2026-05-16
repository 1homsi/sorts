{-@ LIQUID "--reflection" @-}
module GnomeSort where

import Data.Array.IO

{-@ gnomeSort :: arr:IOArray Int Int -> n:Nat -> IO () @-}
gnomeSort :: IOArray Int Int -> Int -> IO ()
gnomeSort arr n = loop 0
  where
    loop i
      | i >= n = return ()
      | i == 0 = loop (i + 1)
      | otherwise = do
          x <- readArray arr i
          y <- readArray arr (i - 1)
          if x >= y
            then loop (i + 1)
            else do
              writeArray arr i y
              writeArray arr (i - 1) x
              loop (i - 1)
