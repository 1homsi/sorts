(DEFUN BUBBLESORT (ARR)
  (PROG (N I J TEMP)
    (SETQ N (LENGTH ARR))
    (SETQ I 0)
    LOOP1
    (COND ((>= I N) (RETURN ARR)))
    (SETQ J 0)
    LOOP2
    (COND ((>= J (- N 1 I)) (GO LOOP1INC)))
    (COND ((> (NTH J ARR) (NTH (+ J 1) ARR))
      (SETQ TEMP (NTH J ARR))
      (RPLACA (NTHCDR J ARR) (NTH (+ J 1) ARR))
      (RPLACA (NTHCDR (+ J 1) ARR) TEMP)))
    (SETQ J (+ J 1))
    (GO LOOP2)
    LOOP1INC
    (SETQ I (+ I 1))
    (GO LOOP1)))

(PRINT (BUBBLESORT '(5 2 8 1 9 3)))