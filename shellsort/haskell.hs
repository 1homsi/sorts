import Data.List (intercalate)
import Data.Vector (Vector, fromList, toList, (!), (//))
import qualified Data.Vector as V

shellSort :: Vector Int -> Vector Int
shellSort vec = go vec (V.length vec `div` 2)
  where
    go v 0 = v
    go v gap = go (insertionPass v gap (gap) (V.length v)) (gap `div` 2)
    insertionPass v gap i n
      | i >= n = v
      | otherwise =
          let temp = v ! i
              v' = shiftBack v gap i temp
          in insertionPass v' gap (i + 1) n
    shiftBack v gap j temp
      | j < gap || v ! (j - gap) <= temp = v // [(j, temp)]
      | otherwise = shiftBack (v // [(j, v ! (j - gap))]) gap (j - gap) temp

main :: IO ()
main = do
  let arr = fromList [64, 34, 25, 12, 22, 11, 90]
  print $ toList $ shellSort arr
