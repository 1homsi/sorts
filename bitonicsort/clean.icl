module BitonicSort

import StdEnv

compareAndSwap :: {#Int} Int Int Bool -> {#Int}
compareAndSwap arr i j dir
    | dir == (arr.[i] > arr.[j]) = { arr & [i] = arr.[j], [j] = arr.[i] }
    | otherwise = arr

bitonicMerge :: {#Int} Int Int Bool -> {#Int}
bitonicMerge arr lo cnt dir
    | cnt <= 1 = arr
    | otherwise =
        let k = cnt / 2
            arr2 = foldl (\a i -> compareAndSwap a i (i+k) dir) arr [lo..lo+k-1]
            arr3 = bitonicMerge arr2 lo k dir
        in bitonicMerge arr3 (lo+k) k dir

bitonicSort :: {#Int} Int Int Bool -> {#Int}
bitonicSort arr lo cnt dir
    | cnt <= 1 = arr
    | otherwise =
        let k = cnt / 2
            arr2 = bitonicSort arr lo k True
            arr3 = bitonicSort arr2 (lo+k) k False
        in bitonicMerge arr3 lo cnt dir

Start :: {#Int}
Start =
    let data = {3, 7, 4, 8, 6, 2, 1, 5}
    in bitonicSort data 0 (size data) True
