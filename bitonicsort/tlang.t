(define bitonicsort (lambda (arr lo cnt dir)
  (if (> cnt 1)
    (let ((k (quotient cnt 2)))
      (bitonicmerge
        (bitonicsort
          (bitonicsort arr lo k 1)
          (+ lo k) k 0)
        lo cnt dir))
    arr)))

(define bitonicmerge (lambda (arr lo cnt dir)
  (if (> cnt 1)
    (let ((k (quotient cnt 2)))
      (bitonicmerge
        (bitonicmerge arr lo k dir)
        (+ lo k) k dir))
    arr)))

(define arr [5 2 8 1 9 3 7 4])
(print (bitonicsort arr 0 8 1))
