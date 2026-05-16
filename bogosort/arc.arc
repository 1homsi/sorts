(def is-sorted (lst)
  (or (no lst) (no (cdr lst))
      (and (<= (car lst) (cadr lst))
           (is-sorted (cdr lst)))))

(def shuffle (lst)
  (let v (list->vector lst)
    (let n (len v)
      (for i (- n 1) 1
        (let j (rand (+ i 1))
          (let tmp (v i)
            (= (v i) (v j))
            (= (v j) tmp)))))
    (vector->list v)))

(def bogosort (lst)
  (if (is-sorted lst) lst
      (bogosort (shuffle lst))))

(prn (bogosort '(3 1 4 1 5 9 2 6)))
