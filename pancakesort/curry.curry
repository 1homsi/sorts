import Data.List (maximumBy)
import Data.Ord (comparing)

flipList :: [Int] -> Int -> [Int]
flipList xs k = reverse (take (k+1) xs) ++ drop (k+1) xs

findMaxIdx :: [Int] -> Int -> Int
findMaxIdx xs size =
  let sub = take size xs
      maxVal = maximum sub
  in length (takeWhile (/= maxVal) sub)

pancakeSort :: [Int] -> [Int]
pancakeSort xs = go xs (length xs)
  where
    go ys 1 = ys
    go ys sz =
      let mi = findMaxIdx ys sz
          ys1 = if mi /= 0 then flipList ys mi else ys
          ys2 = flipList ys1 (sz - 1)
      in go ys2 (sz - 1)

main :: IO ()
main = print (pancakeSort [3, 6, 2, 7, 4, 1, 5])
