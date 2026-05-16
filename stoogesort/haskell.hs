import Data.List (intercalate)
import Data.Array.IO

stoogeSort :: IOArray Int Int -> Int -> Int -> IO ()
stoogeSort arr first last = do
    a <- readArray arr first
    b <- readArray arr last
    if a > b
        then do
            writeArray arr first b
            writeArray arr last a
        else return ()
    if last - first + 1 > 2
        then do
            let t = (last - first + 1) * 2 `div` 3
            stoogeSort arr first (first + t - 1)
            stoogeSort arr (last - t + 1) last
            stoogeSort arr first (first + t - 1)
        else return ()

main :: IO ()
main = do
    let xs = [3, 1, 4, 1, 5, 9, 2, 6] :: [Int]
    arr <- newListArray (0, length xs - 1) xs :: IO (IOArray Int Int)
    stoogeSort arr 0 (length xs - 1)
    sorted <- getElems arr
    putStrLn $ intercalate " " (map show sorted)
