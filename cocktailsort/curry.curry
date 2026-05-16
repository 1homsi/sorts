import Data.List (elemIndex)

cocktailSort :: [Int] -> [Int]
cocktailSort [] = []
cocktailSort xs = go xs 0 (length xs - 1) True
  where
    go arr _ _ False = arr
    go arr start end True =
      let (arr1, sw1) = forwardPass arr start end False
          (arr2, sw2) = if sw1 then backwardPass arr1 start (end-1) False
                        else (arr1, False)
      in if sw1 then go arr2 (start+1) (end-1) sw2 else arr1

    forwardPass arr i end sw
      | i >= end = (arr, sw)
      | arr !! i > arr !! (i+1) =
          forwardPass (swapAt arr i (i+1)) (i+1) end True
      | otherwise = forwardPass arr (i+1) end sw

    backwardPass arr start i sw
      | i < start = (arr, sw)
      | arr !! i > arr !! (i+1) =
          backwardPass (swapAt arr i (i+1)) start (i-1) True
      | otherwise = backwardPass arr start (i-1) sw

    swapAt lst i j =
      [ if k == i then lst !! j
        else if k == j then lst !! i
        else lst !! k
      | k <- [0..length lst - 1] ]
