module combsort

import StdEnv, StdArray

combSort :: {#Int} -> {#Int}
combSort arr = code {
    push_a 0
    .d 1 0
    jsr combSortImpl
    .o 1 0
}

combSortImpl :: {#Int} -> {#Int}
combSortImpl arr
    = loop arr n n
  where
    n = size arr
    loop arr n gap
        # newGap = max 1 (toInt (toReal gap / 1.3))
        # (arr, changed) = pass arr n newGap 0 False
        | newGap == 1 && not changed = arr
        | otherwise = loop arr n newGap
    pass arr n gap i changed
        | i + gap >= n = (arr, changed)
        # a = arr.[i]
        # b = arr.[i + gap]
        | a > b
            # arr = { arr & [i] = b, [i + gap] = a }
            = pass arr n gap (i + 1) True
        | otherwise = pass arr n gap (i + 1) changed
