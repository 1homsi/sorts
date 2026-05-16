module CocktailSort

import Data.Vect

forwardPass : (Vect n Int, Bool) -> Nat -> Nat -> (Vect n Int, Bool)
forwardPass (arr, sw) i end =
  if i >= end then (arr, sw)
  else
    let a = index (fromNat i) arr
        b = index (fromNat (i + 1)) arr
    in if a > b
       then forwardPass (replaceAt (fromNat (i+1)) a (replaceAt (fromNat i) b arr), True) (i + 1) end
       else forwardPass (arr, sw) (i + 1) end

cocktailSort : Vect n Int -> Vect n Int
cocktailSort arr = go arr True 0 (minus (length arr) 1)
  where
    go : Vect n Int -> Bool -> Nat -> Nat -> Vect n Int
    go arr False _ _ = arr
    go arr True start end =
      let (arr1, sw1) = forwardPass (arr, False) start end
      in if not sw1 then arr1
         else
           let (arr2, sw2) = forwardPass (arr1, False) end start
           in go arr2 sw2 (start + 1) (minus end 1)
