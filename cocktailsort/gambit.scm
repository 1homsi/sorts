(define (cocktailsort arr)
  (let ((n (vector-length arr)))
    (define (iter i)
      (if (>= i n)
        arr
        (let loop ((k 0) (swapped #f))
          (if (>= k (- n i 1))
            (if swapped
              (iter (+ i 1))
              arr)
            (if (> (vector-ref arr k) (vector-ref arr (+ k 1)))
              (begin
                (let ((temp (vector-ref arr k)))
                  (vector-set! arr k (vector-ref arr (+ k 1)))
                  (vector-set! arr (+ k 1) temp))
                (loop (+ k 1) #t))
              (loop (+ k 1) swapped))))))
    (iter 0)))

(print (cocktailsort (vector 5 2 8 1 9 3)))
