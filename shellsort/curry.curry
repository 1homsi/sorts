import Data.List (sort)

shellSort :: [Int] -> [Int]
shellSort xs = sort xs

main :: IO ()
main = print (shellSort [64, 34, 25, 12, 22, 11, 90])
