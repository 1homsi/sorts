data Tree a = Leaf | Node (Tree a) a (Tree a)

insert :: Ord a => Tree a -> a -> Tree a
insert Leaf v = Node Leaf v Leaf
insert (Node l x r) v
  | v < x    = Node (insert l v) x r
  | otherwise = Node l x (insert r v)

inorder :: Tree a -> [a]
inorder Leaf = []
inorder (Node l v r) = inorder l ++ [v] ++ inorder r

treesort :: Ord a => [a] -> [a]
treesort = inorder . foldl insert Leaf

main :: IO ()
main = print $ treesort [5, 3, 7, 1, 4, 6, 8 :: Int]
