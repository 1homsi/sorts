module SelectionSort

selectionSort : Ord a => List a -> List a
selectionSort [] = []
selectionSort xs =
  let m = foldl1 min xs
      rest = deleteBy (==) m xs
  in m :: selectionSort rest
  where
    deleteBy : (a -> a -> Bool) -> a -> List a -> List a
    deleteBy _ _ [] = []
    deleteBy eq x (y :: ys) = if eq x y then ys else y :: deleteBy eq x ys
