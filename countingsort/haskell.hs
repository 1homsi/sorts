import Data.List (group, sort)

countingSort :: [Int] -> [Int]
countingSort [] = []
countingSort xs = concatMap expand counts
  where
    minVal = minimum xs
    maxVal = maximum xs
    range = maxVal - minVal + 1
    counts = foldl (\acc x -> let i = x - minVal
                                   (before, cur:after) = splitAt i acc
                               in before ++ (cur + 1) : after)
                   (replicate range 0) xs
    expand (i, c) = replicate c (i + minVal)
    indexed = zip [0..] counts

main :: IO ()
main = print (countingSort [4, 2, 2, 8, 3, 3, 1])
