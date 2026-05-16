(DEFUN GNOMESORT (ARR)
  (PROG (I TEMP)
    (SETQ I 0)
    LOOP
    (COND ((>= I (LENGTH ARR))
           (RETURN ARR)))
    (COND ((= I 0)
           (SETQ I (+ I 1)))
          ((< (NTH I ARR) (NTH (- I 1) ARR))
           (SETQ TEMP (NTH I ARR))
           (RPLACA (NTH I ARR) (NTH (- I 1) ARR))
           (RPLACA (NTH (- I 1) ARR) TEMP)
           (SETQ I (- I 1)))
          (T
           (SETQ I (+ I 1))))
    (GO LOOP)))

(SETQ TEST '(5 2 8 1 9 3))
(PRINT (GNOMESORT TEST))
