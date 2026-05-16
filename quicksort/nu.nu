(function quicksort (lst)
    (if (<= (lst count) 1)
        lst
        (let ((pivot (lst objectAtIndex: (/ (lst count) 2)))
              (left (lst select: (do (x) (< x pivot))))
              (middle (lst select: (do (x) (== x pivot))))
              (right (lst select: (do (x) (> x pivot)))))
            (set result (NSMutableArray array))
            (result addObjectsFromArray: (quicksort left))
            (result addObjectsFromArray: middle)
            (result addObjectsFromArray: (quicksort right))
            result)))

(puts (quicksort '(3 6 8 10 1 2 1)))
