import Data.Array.IArray

combSort :: [Int] -> [Int]
combSort xs = elems $ sortArr (listArray (0, n-1) xs) n n
  where
    n = length xs
    sortArr arr _ 1 = arr
    sortArr arr size gap =
        let newGap = max 1 (div (gap * 10) 13)
            arr' = foldl (\a i ->
                let j = i + newGap
                in if a ! i > a ! j
                   then a // [(i, a ! j), (j, a ! i)]
                   else a)
                arr [0..size - newGap - 1]
        in sortArr arr' size newGap
