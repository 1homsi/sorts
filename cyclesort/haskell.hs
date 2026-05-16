import Data.Array.IO
import Control.Monad (when, forM_)
import Data.IORef

cycleSort :: IOArray Int Int -> Int -> IO Int
cycleSort arr n = do
    writesRef <- newIORef 0
    forM_ [0..n-2] $ \cycleStart -> do
        item0 <- readArray arr cycleStart
        itemRef <- newIORef item0
        posRef <- newIORef cycleStart
        forM_ [cycleStart+1..n-1] $ \i -> do
            v <- readArray arr i
            it <- readIORef itemRef
            when (v < it) $ modifyIORef posRef (+1)
        pos0 <- readIORef posRef
        when (pos0 /= cycleStart) $ do
            let skipDups = do
                    p <- readIORef posRef
                    it <- readIORef itemRef
                    v <- readArray arr p
                    when (v == it) $ do
                        modifyIORef posRef (+1)
                        skipDups
            skipDups
            p <- readIORef posRef
            it <- readIORef itemRef
            v <- readArray arr p
            writeArray arr p it
            writeIORef itemRef v
            modifyIORef writesRef (+1)
            let loop = do
                    p2 <- readIORef posRef
                    when (p2 /= cycleStart) $ do
                        writeIORef posRef cycleStart
                        forM_ [cycleStart+1..n-1] $ \i -> do
                            vi <- readArray arr i
                            it2 <- readIORef itemRef
                            when (vi < it2) $ modifyIORef posRef (+1)
                        skipDups
                        p3 <- readIORef posRef
                        it3 <- readIORef itemRef
                        v3 <- readArray arr p3
                        writeArray arr p3 it3
                        writeIORef itemRef v3
                        modifyIORef writesRef (+1)
                        loop
            loop
    readIORef writesRef

main :: IO ()
main = do
    let xs = [5, 4, 3, 2, 1]
    arr <- newListArray (0, length xs - 1) xs :: IO (IOArray Int Int)
    cycleSort arr (length xs)
    sorted <- getElems arr
    print sorted
