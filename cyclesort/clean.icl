module CycleSort

import StdEnv, StdArray

cycleSort :: {#Int} -> {#Int}
cycleSort arr =
    let n = size arr
    in foldl (doStep n) arr [0..n-2]

doStep :: Int {#Int} Int -> {#Int}
doStep n arr cycleStart =
    let item = arr.[cycleStart]
        pos = cycleStart + length [x \\ x <-: arr | x < item] - length [x \\ x <-: arr.[..cycleStart] | x < item]
    in if (pos == cycleStart) arr
       (let arr2 = { arr & [pos] = item, [cycleStart] = arr.[pos] }
        in arr2)

Start :: {#Int}
Start = cycleSort {5, 4, 3, 2, 1}
