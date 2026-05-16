module clean

import StdEnv
import StdList
import StdArray

insertSorted :: Real [Real] -> [Real]
insertSorted x [] = [x]
insertSorted x [h:t]
    | x <= h    = [x, h : t]
    | otherwise = [h : insertSorted x t]

insertionSort :: [Real] -> [Real]
insertionSort [] = []
insertionSort [h:t] = insertSorted h (insertionSort t)

getIdx :: Real Real Real Int -> Int
getIdx num mn mx n =
    let raw = toInt (floor ((num - mn) / (mx - mn + 1.0) * toReal n))
    in min (n - 1) raw

bucketSort :: [Real] -> [Real]
bucketSort [] = []
bucketSort arr =
    let n = length arr
        mn = minimum arr
        mx = maximum arr
        buckets = [ filter (\x -> getIdx x mn mx n == i) arr \\ i <- [0..n-1] ]
    in flatten (map insertionSort buckets)

Start :: *World -> *World
Start world
    # (io, world) = stdio world
    # sorted = bucketSort [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
    # io = foldl (\io v -> io <<< v <<< " ") io sorted
    # io = io <<< "\n"
    = snd (fclose io world)
