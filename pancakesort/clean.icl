module pancake_sort

import StdEnv, Data.Array

flipArr :: {#Int} Int -> {#Int}
flipArr arr k = go arr 0 k
where
    go a l r
        | l >= r = a
        | otherwise =
            let tmp = a.[l]
                a1 = {a & [l] = a.[r]}
                a2 = {a1 & [r] = tmp}
            in go a2 (l+1) (r-1)

findMaxIdx :: {#Int} Int -> Int
findMaxIdx arr size = go 1 0
where
    go i mi
        | i >= size = mi
        | arr.[i] > arr.[mi] = go (i+1) i
        | otherwise = go (i+1) mi

pancakeSort :: {#Int} -> {#Int}
pancakeSort arr = go arr (size arr)
where
    go a sz
        | sz <= 1 = a
        | otherwise =
            let mi = findMaxIdx a sz
                a1 = if (mi <> 0) (flipArr a mi) a
                a2 = flipArr a1 (sz-1)
            in go a2 (sz-1)

Start :: {#Int}
Start = pancakeSort {3, 6, 2, 7, 4, 1, 5}
