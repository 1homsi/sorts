import System.Random

isSorted :: [Int] -> Bool
isSorted [] = True
isSorted [_] = True
isSorted (x:y:rest) = x <= y && isSorted (y:rest)

shuffle :: [Int] -> IO [Int]
shuffle [] = return []
shuffle xs = do
    i <- getRandomR (0, length xs - 1)
    let (a, b:bs) = splitAt i xs
    rest <- shuffle (a ++ bs)
    return (b : rest)

bogosort :: [Int] -> IO [Int]
bogosort xs = do
    if isSorted xs
        then return xs
        else shuffle xs >>= bogosort

main :: IO ()
main = do
    sorted <- bogosort [3, 1, 4, 1, 5, 9, 2, 6]
    print sorted
