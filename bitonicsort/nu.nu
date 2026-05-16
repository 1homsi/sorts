(function compareAndSwap (arr i j dir)
    (set ai (arr i))
    (set aj (arr j))
    (if (== dir (> ai aj))
        (then
            (arr setValue:aj forKey:i)
            (arr setValue:ai forKey:j))))

(function bitonicMerge (arr lo cnt dir)
    (if (> cnt 1)
        (then
            (set k (/ cnt 2))
            (set i lo)
            (while (< i (+ lo k))
                (compareAndSwap arr i (+ i k) dir)
                (set i (+ i 1)))
            (bitonicMerge arr lo k dir)
            (bitonicMerge arr (+ lo k) k dir))))

(function bitonicSort (arr lo cnt dir)
    (if (> cnt 1)
        (then
            (set k (/ cnt 2))
            (bitonicSort arr lo k YES)
            (bitonicSort arr (+ lo k) k NO)
            (bitonicMerge arr lo cnt dir))))

(set data (NSMutableArray arrayWithArray:'(3 7 4 8 6 2 1 5)))
(bitonicSort data 0 (data count) YES)
(puts (data description))
