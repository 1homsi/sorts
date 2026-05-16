(DEFINE BUCKETSORT
  (LAMBDA (ARR MAXVAL)
    (COND
      ((ZEROP MAXVAL) ARR)
      (T (LET ((BUCKETS (MAKE-ARRAY MAXVAL)))
           (MAPC (LAMBDA (NUM)
                   (COND
                     ((AND (>= NUM 0) (< NUM MAXVAL))
                      (ASET (CONS NUM (AREF BUCKETS NUM)) BUCKETS NUM))))
                 ARR)
           (LET ((RESULT NIL))
             (DO ((I 0 (1+ I)))
                 ((>= I MAXVAL) (REVERSE RESULT))
               (SETQ RESULT
                     (APPEND (AREF BUCKETS I) RESULT)))))))))
(BUCKETSORT '(5 2 8 1 9 3) 10)