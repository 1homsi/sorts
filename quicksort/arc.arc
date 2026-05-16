(def quicksort (lst)
  (if (<= (len lst) 1)
      lst
      (let pivot (lst (/ (len lst) 2))
        (+ (quicksort (keep [< _ pivot] lst))
           (keep [is _ pivot] lst)
           (quicksort (keep [> _ pivot] lst))))))

(prn (quicksort '(3 6 8 10 1 2 1)))
