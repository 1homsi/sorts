module CocktailSort where

import Prelude
import Data.Array (length, unsafeIndex, updateAt)
import Data.Maybe (fromMaybe)

swapAt :: Array Int -> Int -> Int -> Array Int
swapAt arr i j =
  let a = unsafeIndex arr i
      b = unsafeIndex arr j
  in fromMaybe arr (updateAt i b arr >>= updateAt j a)

forwardPass :: Array Int -> Int -> Int -> { arr :: Array Int, swapped :: Boolean }
forwardPass arr start end
  | start >= end = { arr, swapped: false }
  | otherwise =
      let a = unsafeIndex arr start
          b = unsafeIndex arr (start + 1)
          { arr: arr', swapped: sw } = forwardPass arr (start + 1) end
      in if a > b
         then { arr: swapAt arr' start (start + 1), swapped: true }
         else { arr: arr', swapped: sw }

cocktailSort :: Array Int -> Array Int
cocktailSort arr = go arr true 0 (length arr - 1)
  where
    go a false _ _ = a
    go a true s e =
      let { arr: a1, swapped: sw1 } = forwardPass a s e
      in if not sw1 then a1
         else
           let { arr: a2, swapped: sw2 } = forwardPass a1 e s
           in go a2 sw2 (s + 1) (e - 1)
