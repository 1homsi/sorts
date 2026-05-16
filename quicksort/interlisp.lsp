(DEFINEQ QUICKSORT
  ((ARR)
   (COND
     ((<= (LENGTH ARR) 1) ARR)
     (T
       (LET ((PIVOT (CAR ARR))
             (REST (CDR ARR)))
         (NCONC (QUICKSORT (FILTER ARR
                            (FUNCTION (LAMBDA (X) (<= X PIVOT)))))
                (CONS PIVOT (QUICKSORT
                  (FILTER ARR
                   (FUNCTION (LAMBDA (X) (> X PIVOT)))))))))))))

(PRINT (QUICKSORT '(5 2 8 1 9 3)))