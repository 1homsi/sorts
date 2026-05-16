module CombSort

import Data.List
import Data.Vect

combSortPass : List Int -> Nat -> List Int -> (List Int, Bool)
combSortPass [] _ acc = (reverse acc, False)
combSortPass xs gap acc =
    let n = length xs
        loop : List Int -> Nat -> Bool -> List Int
        loop arr i changed =
            case i + gap >= n of
                True => arr
                False =>
                    let a = index' i arr
                        b = index' (i + gap) arr
                    in case a > b of
                        True =>
                            let arr' = updateAt i b (updateAt (i + gap) a arr)
                            in loop arr' (i + 1) True
                        False => loop arr (i + 1) changed
    in (loop xs 0 False, True)
  where
    index' : Nat -> List Int -> Int
    index' _ [] = 0
    index' Z (x::_) = x
    index' (S n) (_::xs) = index' n xs
    updateAt : Nat -> Int -> List Int -> List Int
    updateAt _ _ [] = []
    updateAt Z v (_::xs) = v :: xs
    updateAt (S n) v (x::xs) = x :: updateAt n v xs
