(DEFINEQ HEAPSORT
  (LAMBDA (ARR)
    (PROG (N I TEMP)
      (SETQ N (LENGTH ARR))
      (SETQ I (- (/ N 2) 1))
      (LOOP
        (COND ((< I 0) (GO ENDHEAP1)))
        (SIFTDOWN ARR I N)
        (SETQ I (- I 1))
        (GO LOOP))
      ENDHEAP1
      (SETQ I (- N 1))
      (LOOP
        (COND ((<= I 0) (GO ENDHEAP2)))
        (SETQ TEMP (ELT ARR 0))
        (RPLACA (NTH ARR 0) (ELT ARR I))
        (RPLACA (NTH ARR I) TEMP)
        (SIFTDOWN ARR 0 I)
        (SETQ I (- I 1))
        (GO LOOP))
      ENDHEAP2
      (RETURN ARR))))

(PRINT (HEAPSORT '(5 2 8 1 9 3)))
