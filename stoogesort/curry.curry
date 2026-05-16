import Data.List (intercalate)

stoogeSort :: [Int] -> Int -> Int -> [Int]
stoogeSort arr first last
    | arr !! first > arr !! last = stoogeSort' swapped first last
    | otherwise = stoogeSort' arr first last
    where
        swapped = replaceAt first (arr !! last) (replaceAt last (arr !! first) arr)
        stoogeSort' a f l
            | l - f + 1 > 2 = let t = (l - f + 1) * 2 `div` 3
                                   a1 = stoogeSort a f (f + t - 1)
                                   a2 = stoogeSort a1 (l - t + 1) l
                               in stoogeSort a2 f (f + t - 1)
            | otherwise = a

replaceAt :: Int -> a -> [a] -> [a]
replaceAt i x xs = take i xs ++ [x] ++ drop (i+1) xs

main :: IO ()
main = do
    let arr = [3, 1, 4, 1, 5, 9, 2, 6]
    print $ stoogeSort arr 0 (length arr - 1)
