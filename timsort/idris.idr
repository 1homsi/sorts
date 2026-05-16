module TimSort

import Data.List

insert : Ord a => a -> List a -> List a
insert x [] = [x]
insert x (y :: ys) = if x <= y then x :: y :: ys else y :: insert x ys

insertionSort : Ord a => List a -> List a
insertionSort [] = []
insertionSort (x :: xs) = insert x (insertionSort xs)

mergeRuns : Ord a => List a -> List a -> List a
mergeRuns [] ys = ys
mergeRuns xs [] = xs
mergeRuns (x :: xs) (y :: ys) =
    if x <= y then x :: mergeRuns xs (y :: ys)
    else y :: mergeRuns (x :: xs) ys

chunksOf : Nat -> List a -> List (List a)
chunksOf _ [] = []
chunksOf n xs = take n xs :: chunksOf n (drop n xs)

mergePairs : Ord a => List (List a) -> List (List a)
mergePairs [] = []
mergePairs [x] = [x]
mergePairs (x :: y :: rest) = mergeRuns x y :: mergePairs rest

mergeAll : Ord a => List (List a) -> List a
mergeAll [] = []
mergeAll [x] = x
mergeAll xs = mergeAll (mergePairs xs)

timsort : Ord a => List a -> List a
timsort [] = []
timsort xs = mergeAll (map insertionSort (chunksOf 32 xs))

main : IO ()
main = printLn (timsort [5, 2, 8, 1, 9, 3, 7, 4, 6] {a=Int})
