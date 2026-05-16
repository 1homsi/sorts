(DEFINEQ TIMSORT
  ((ARR MINSIZE)
   (MERGESORT ARR MINSIZE)))

(DEFINEQ MERGESORT
  ((ARR MINSIZE)
   (COND
     ((LESSP (LENGTH ARR) 2) ARR)
     ((LESSP (LENGTH ARR) (PLUS MINSIZE 1))
      (INSERTIONSORT ARR))
     (T (PROG (MID LEFT RIGHT)
          (SETQ MID (QUOTIENT (LENGTH ARR) 2))
          (SETQ LEFT (SUBLIST ARR 1 MID))
          (SETQ RIGHT (SUBLIST ARR (PLUS MID 1) (LENGTH ARR)))
          (RETURN (MERGE (MERGESORT LEFT MINSIZE)
                         (MERGESORT RIGHT MINSIZE))))))))

(DEFINEQ INSERTIONSORT
  ((ARR)
   (PROG (RES I J KEY)
     (SETQ RES ARR)
     (SETQ I 2)
     (LOOP
       (COND
         ((GREATERP I (LENGTH RES)) (RETURN RES)))
       (SETQ KEY (NTH I RES))
       (SETQ J (DIFFERENCE I 1))
       (LOOP
         (COND
           ((OR (LESSP J 1) (NOT (GREATERP (NTH J RES) KEY)))
            (RETURN)))
         (RPLACA (NTH J RES) (NTH (PLUS J 1) RES))
         (SETQ J (DIFFERENCE J 1)))
       (RPLACA (NTH (PLUS J 1) RES) KEY)
       (SETQ I (PLUS I 1))))))

(DEFINEQ MERGE
  ((LEFT RIGHT)
   (PROG (RES I J)
     (SETQ RES NIL)
     (SETQ I 1)
     (SETQ J 1)
     (LOOP
       (COND
         ((OR (GREATERP I (LENGTH LEFT)) (GREATERP J (LENGTH RIGHT)))
          (RETURN RES)))
       (COND
         ((LEQ (NTH I LEFT) (NTH J RIGHT))
          (SETQ RES (APPEND RES (LIST (NTH I LEFT))))
          (SETQ I (PLUS I 1)))
         (T
          (SETQ RES (APPEND RES (LIST (NTH J RIGHT))))
          (SETQ J (PLUS J 1))))))))
