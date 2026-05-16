module heapsort

import StdEnv

heapify :: {#Int} Int Int -> {#Int}
heapify arr n i
    # left = 2 * i + 1
    # right = 2 * i + 2
    # largest0 = if (left < n && arr.[left] > arr.[i]) left i
    # largest = if (right < n && arr.[right] > arr.[largest0]) right largest0
    | largest == i = arr
    # vi = arr.[i]
    # vl = arr.[largest]
    # arr = {arr & [i] = vl, [largest] = vi}
    = heapify arr n largest

heapsort :: {#Int} -> {#Int}
heapsort arr
    # n = size arr
    # arr = foldl (\a i -> heapify a n i) arr [n/2-1,n/2-2..0]
    # arr = foldl (\a i ->
                let vi = a.[i]
                    v0 = a.[0]
                    a1 = {a & [0] = vi, [i] = v0}
                in heapify a1 i 0) arr [n-1,n-2..1]
    = arr

Start :: [Int]
Start = toList (heapsort (fromList [12,11,13,5,6,7]))
  where
    fromList xs = {x \\ x <- xs}
    toList arr = [arr.[i] \\ i <- [0..size arr - 1]]
