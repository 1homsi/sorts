(define is-sorted
  [] -> true
  [_] -> true
  [A B | Rest] -> (and (<= A B) (is-sorted [B | Rest])))

(define shuffle
  Lst -> (let N (length Lst)
              V (list->vector Lst)
              _ (for (- N 1) 1 (fn I
                  (let J (1+ (mod (random N) (1+ I)))
                       Tmp (vector-> V I J)
                       _ (vector-> V J Tmp)
                    skip)))
           (vector->list V)))

(define bogosort
  Lst -> (if (is-sorted Lst)
             Lst
             (bogosort (shuffle Lst))))

(print (bogosort [3 1 4 1 5 9 2 6]))
