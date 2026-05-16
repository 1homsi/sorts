module bogosort

import StdEnv, System.Random

isSorted :: [Int] -> Bool
isSorted [] = True
isSorted [_] = True
isSorted [x:y:rest] = x <= y && isSorted [y:rest]

shuffle :: [Int] RandomStream -> ([Int], RandomStream)
shuffle lst rnd =
    let n = length lst
        arr = {x \\ x <- lst}
        (arr2, rnd2) = foldl (\(a, r) i ->
            let (j, r2) = randomInt r
                j2 = abs j rem (i + 1)
                tmp = a.[i]
            in ({a & [i] = a.[j2], [j2] = tmp}, r2))
            (arr, rnd)
            (reverse [0..n-2])
    in ([arr2.[i] \\ i <- [0..n-1]], rnd2)

bogosort :: [Int] RandomStream -> [Int]
bogosort lst rnd
    | isSorted lst = lst
    | otherwise    = let (lst2, rnd2) = shuffle lst rnd
                     in bogosort lst2 rnd2

Start :: *World -> *World
Start world
    # (rnd, world) = openRandomStream world
    # sorted = bogosort [3, 1, 4, 1, 5, 9, 2, 6] rnd
    # world = stderr world
    = world
