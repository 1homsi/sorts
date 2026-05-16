module InsertionSort

insert : Ord a => a -> List a -> List a
insert x [] = [x]
insert x (y :: ys) = if x <= y then x :: y :: ys else y :: insert x ys

insertionSort : Ord a => List a -> List a
insertionSort [] = []
insertionSort (x :: xs) = insert x (insertionSort xs)
