import Data.List (minimumBy)
import Data.Ord (comparing)

selectionSort :: Ord a => [a] -> [a]
selectionSort [] = []
selectionSort xs =
  let m = minimum xs
      rest = deleteFirst m xs
  in m : selectionSort rest

deleteFirst :: Eq a => a -> [a] -> [a]
deleteFirst _ [] = []
deleteFirst x (y:ys)
  | x == y    = ys
  | otherwise = y : deleteFirst x ys
