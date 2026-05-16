module shellsort

import StdEnv
import Data.Array

shellSort :: {#Int} -> {#Int}
shellSort arr
    # n = size arr
    = gapLoop arr n (n / 2)
  where
    gapLoop arr _ 0 = arr
    gapLoop arr n gap
        # arr = insertionPass arr n gap gap
        = gapLoop arr n (gap / 2)
    insertionPass arr n gap i
        | i >= n = arr
        # temp = arr.[i]
          arr = shiftBack arr gap i temp
        = insertionPass arr n gap (i + 1)
    shiftBack arr gap j temp
        | j >= gap && arr.[j - gap] > temp
            # arr = {arr & [j] = arr.[j - gap]}
            = shiftBack arr gap (j - gap) temp
        | otherwise = {arr & [j] = temp}

Start :: {#Int}
Start = shellSort {64, 34, 25, 12, 22, 11, 90}
