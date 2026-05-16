import System.Random

isSorted xs = and $ zipWith (<=) xs (tail xs)

bogosort xs = if isSorted xs then xs else bogosort shuffled
  where shuffled = xs
