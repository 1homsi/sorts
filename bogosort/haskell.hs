import System.Random
import Data.List (permutations)

isSorted :: Ord a => [a] -> Bool
isSorted [] = True
isSorted [_] = True
isSorted (x:y:rest) = x <= y && isSorted (y:rest)

shuffle :: [a] -> IO [a]
shuffle [] = return []
shuffle xs = do
    i <- randomRIO (0, length xs - 1)
    let (a, b:bs) = splitAt i xs
    rest <- shuffle (a ++ bs)
    return (b : rest)

bogosort :: Ord a => [a] -> IO [a]
bogosort xs = do
    shuffled <- shuffle xs
    if isSorted shuffled
        then return shuffled
        else bogosort xs

main :: IO ()
main = do
    let arr = [3, 1, 4, 1, 5, 9, 2, 6 :: Int]
    sorted <- bogosort arr
    print sorted
