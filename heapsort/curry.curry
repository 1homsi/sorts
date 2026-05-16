import Data.List (foldl')
import Control.Monad (when)
import Data.IORef

heapify :: IORef [Int] -> Int -> Int -> IO ()
heapify arrRef n i = do
    arr <- readIORef arrRef
    let left = 2 * i + 1
        right = 2 * i + 2
        largest0 = if left < n && arr !! left > arr !! i then left else i
        largest = if right < n && arr !! right > arr !! largest0 then right else largest0
    when (largest /= i) $ do
        let vi = arr !! i
            vl = arr !! largest
            arr' = zipWith (\idx v -> if idx == i then vl else if idx == largest then vi else v) [0..] arr
        writeIORef arrRef arr'
        heapify arrRef n largest

heapsort :: [Int] -> IO [Int]
heapsort xs = do
    arrRef <- newIORef xs
    let n = length xs
    mapM_ (heapify arrRef n) (reverse [0..n `div` 2 - 1])
    mapM_ (\i -> do
        arr <- readIORef arrRef
        let v0 = head arr
            vi = arr !! i
            arr' = zipWith (\idx v -> if idx == 0 then vi else if idx == i then v0 else v) [0..] arr
        writeIORef arrRef arr'
        heapify arrRef i 0) (reverse [1..n-1])
    readIORef arrRef

main :: IO ()
main = heapsort [12, 11, 13, 5, 6, 7] >>= print
