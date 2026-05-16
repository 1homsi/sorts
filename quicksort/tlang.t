(define quicksort
  (lambda (arr)
    (cond
      ((<= (length arr) 1) arr)
      (#t
        (let ((pivot (car arr))
              (rest (cdr arr)))
          (append
            (quicksort (filter (<= pivot) rest))
            (cons pivot (quicksort (filter (> pivot) rest))))))))))

(display (quicksort '(5 2 8 1 9 3)))