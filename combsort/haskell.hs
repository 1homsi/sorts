import Data.List (foldl')
import Data.Array.IO

combSort :: [Int] -> IO [Int]
combSort xs = do
    let n = length xs
    arr <- newListArray (0, n-1) xs :: IO (IOArray Int Int)
    go arr n n
    getElems arr
  where
    go arr n gap = do
        let gap' = max 1 (floor (fromIntegral gap / 1.3 :: Double))
        changed <- passArr arr n gap'
        if gap' == 1 && not changed
            then return ()
            else go arr n gap'
    passArr arr n gap = do
        results <- mapM (compareSwap arr gap) [0..n-gap-1]
        return (or results)
    compareSwap arr gap i = do
        a <- readArray arr i
        b <- readArray arr (i+gap)
        if a > b
            then do
                writeArray arr i b
                writeArray arr (i+gap) a
                return True
            else return False
