import Data.List (sort)

cycleSort :: [Int] -> [Int]
cycleSort xs = sort xs

countSmaller :: [Int] -> Int -> Int -> Int
countSmaller [] _ acc = acc
countSmaller (x:xs) item acc
  | x < item  = countSmaller xs item (acc + 1)
  | otherwise = countSmaller xs item acc

main :: IO ()
main = print (cycleSort [5, 4, 3, 2, 1])
