(define comb-sort
  Arr N -> (let Gap N
                Sorted false
                (comb-loop Arr N Gap Sorted)))

(define comb-loop
  Arr N 1 true -> Arr
  Arr N Gap _ ->
    (let NewGap (max 1 (floor (/ Gap 1.3)))
         Sorted (= NewGap 1)
         (let Result (comb-pass Arr N NewGap 0 false)
              (comb-loop (fst Result) N NewGap (and Sorted (not (snd Result)))))))

(define comb-pass
  Arr N Gap I Changed
  -> [Arr Changed] where (>= (+ I Gap) N)
  Arr N Gap I Changed ->
    (let A (nth I Arr)
         B (nth (+ I Gap) Arr)
         (if (> A B)
             (let Arr2 (set-nth I B (set-nth (+ I Gap) A Arr))
                  (comb-pass Arr2 N Gap (+ I 1) true))
             (comb-pass Arr N Gap (+ I 1) Changed))))
