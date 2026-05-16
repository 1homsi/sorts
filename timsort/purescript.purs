module TimSort where

import Prelude
import Data.Array (length, slice, snoc, take, drop, concatMap)
import Data.Maybe (fromMaybe)
import Effect (Effect)
import Effect.Console (logShow)

insertVal :: Int -> Array Int -> Array Int
insertVal x arr = case arr of
  [] -> [x]
  _ ->
    let h = fromMaybe 0 (arr `Array.index` 0)
        t = drop 1 arr
    in if x <= h then snoc (x `Array.cons` t) h
       else h `Array.cons` (insertVal x t)

insertionSort :: Array Int -> Array Int
insertionSort arr = case arr of
  [] -> []
  _ ->
    let h = fromMaybe 0 (arr `Array.index` 0)
        t = drop 1 arr
    in insertVal h (insertionSort t)

mergeRuns :: Array Int -> Array Int -> Array Int
mergeRuns xs ys
  | length xs == 0 = ys
  | length ys == 0 = xs
  | otherwise =
      let x = fromMaybe 0 (xs `Array.index` 0)
          y = fromMaybe 0 (ys `Array.index` 0)
      in if x <= y
         then x `Array.cons` mergeRuns (drop 1 xs) ys
         else y `Array.cons` mergeRuns xs (drop 1 ys)

chunksOf :: Int -> Array Int -> Array (Array Int)
chunksOf n arr
  | length arr == 0 = []
  | otherwise = take n arr `Array.cons` chunksOf n (drop n arr)

mergePairs :: Array (Array Int) -> Array (Array Int)
mergePairs runs = case length runs of
  0 -> []
  1 -> runs
  _ ->
    let x = fromMaybe [] (runs `Array.index` 0)
        y = fromMaybe [] (runs `Array.index` 1)
        rest = drop 2 runs
    in (mergeRuns x y) `Array.cons` mergePairs rest

mergeAll :: Array (Array Int) -> Array Int
mergeAll runs = case length runs of
  0 -> []
  1 -> fromMaybe [] (runs `Array.index` 0)
  _ -> mergeAll (mergePairs runs)

timsort :: Array Int -> Array Int
timsort arr =
  if length arr == 0 then arr
  else mergeAll (map insertionSort (chunksOf 32 arr))

main :: Effect Unit
main = logShow (timsort [5, 2, 8, 1, 9, 3, 7, 4, 6])
