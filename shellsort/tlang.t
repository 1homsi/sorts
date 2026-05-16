(define shellsort
  (lambda (arr)
    (let ((n (vector-length arr)))
      (let loop-gap ((gap 1))
        (if (> gap n)
          (loop-gap (* gap 3 -1))
          (begin
            (if (> gap 0)
              (let loop-i ((i gap))
                (if (< i n)
                  (begin
                    (loop-i (+ i 1)))))
              '())
            (loop-gap (quotient gap 3))))))))
(shellsort #(5 2 8 1 9 3))
