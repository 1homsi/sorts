countingSort :: [Int] -> [Int]
countingSort [] = []
countingSort xs =
  let minVal = minimum xs
      maxVal = maximum xs
      countOf v = length (filter (== v) xs)
  in concatMap (\v -> replicate (countOf v) v) [minVal..maxVal]

main :: IO ()
main = print (countingSort [4, 2, 2, 8, 3, 3, 1])
