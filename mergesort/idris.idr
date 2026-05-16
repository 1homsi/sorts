module MergeSort

merge : List Int -> List Int -> List Int
merge [] right = right
merge left [] = left
merge (lh :: lt) (rh :: rt) =
  if lh <= rh
    then lh :: merge lt (rh :: rt)
    else rh :: merge (lh :: lt) rt

mergeSort : List Int -> List Int
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs =
  let mid = length xs `div` 2
      left = take mid xs
      right = drop mid xs
  in merge (mergeSort left) (mergeSort right)

main : IO ()
main = printLn $ mergeSort [38, 27, 43, 3, 9, 82, 10]
