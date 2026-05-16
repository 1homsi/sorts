import List

bubblePass :: [Int] -> ([Int], Bool)
bubblePass [] = ([], False)
bubblePass [x] = ([x], False)
bubblePass (x:y:rest)
  | x > y    = let (sorted, _) = bubblePass (x:rest) in (y:sorted, True)
  | otherwise = let (sorted, sw) = bubblePass (y:rest) in (x:sorted, sw)

bubbleSort :: [Int] -> [Int]
bubbleSort xs =
  let (sorted, swapped) = bubblePass xs
  in if swapped then bubbleSort sorted else sorted

main :: IO ()
main = print $ bubbleSort [64, 34, 25, 12, 22, 11, 90]
