(DEFINE SELECTIONSORT
  (LAMBDA (ARR)
    (PROG (N I J MIN-IDX TMP)
      (SETQ N (LENGTH ARR))
      (SETQ I 0)
      (LOOP
        (COND ((GE I (DIFFERENCE N 1)) (RETURN ARR)))
        (SETQ MIN-IDX I)
        (SETQ J (PLUS I 1))
        (LOOP
          (COND ((GE J N) (GO OUT)))
          (COND ((LT (NTH ARR J) (NTH ARR MIN-IDX))
            (SETQ MIN-IDX J)))
          (SETQ J (PLUS J 1)))
        OUT
        (SETQ TMP (NTH ARR I))
        (RPLACA (NTHCDR ARR I) (NTH ARR MIN-IDX))
        (RPLACA (NTHCDR ARR MIN-IDX) TMP)
        (SETQ I (PLUS I 1))))))

(SELECTIONSORT '(5 2 8 1 9 3))