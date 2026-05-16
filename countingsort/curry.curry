import Data.List (sort)

countingSort :: [Int] -> [Int]
countingSort [] = []
countingSort xs =
  let minVal = minimum xs
      maxVal = maximum xs
      countOf v = length (filter (== v) xs)
      expand v = replicate (countOf v) v
  in concatMap expand [minVal..maxVal]

main :: IO ()
main = print (countingSort [4, 2, 2, 8, 3, 3, 1])
