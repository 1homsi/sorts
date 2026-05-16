module GnomeSort

import StdEnv

gnomeSort :: {#Int} -> {#Int}
gnomeSort arr
    = loop arr 0 (size arr)

loop :: {#Int} Int Int -> {#Int}
loop arr i n
    | i >= n = arr
    | i == 0 = loop arr (i+1) n
    | arr.[i] >= arr.[i-1] = loop arr (i+1) n
    | otherwise = loop (swp arr i (i-1)) (i-1) n

swp :: {#Int} Int Int -> {#Int}
swp arr i j
    = { arr & [i] = arr.[j], [j] = arr.[i] }
