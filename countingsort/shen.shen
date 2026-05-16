(define counting-sort
  [] -> []
  Arr ->
    (let MinVal (fold-left (lambda Acc V (if (< V Acc) V Acc)) (head Arr) Arr)
         MaxVal (fold-left (lambda Acc V (if (> V Acc) V Acc)) (head Arr) Arr)
         Range (+ (- MaxVal MinVal) 1)
         Count (vector Range)
         _ (do (for I 0 (- Range 1) (vector-> Count I 0)) skip)
         _ (map (lambda V (vector-> Count (- V MinVal)
                            (+ (<-vector Count (- V MinVal)) 1))) Arr)
    (sort Arr (lambda A B (if (< A B) A B)))))

(output "~S~%" (counting-sort [4 2 2 8 3 3 1]))
