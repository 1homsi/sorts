(define heapify
    Arr N I ->
    (let Left (+ (* 2 I) 1)
         Right (+ (* 2 I) 2)
         Largest0 (if (and (< Left N) (> (<-address Arr Left) (<-address Arr I))) Left I)
         Largest (if (and (< Right N) (> (<-address Arr Right) (<-address Arr Largest0))) Right Largest0)
         (if (= Largest I)
             Arr
             (let Tmp (<-address Arr I)
                  _ (address-> Arr I (<-address Arr Largest))
                  _ (address-> Arr Largest Tmp)
                  (heapify Arr N Largest)))))

(define heapsort-loop
    Arr N I -> Arr where (< I 0)
    Arr N I -> (heapsort-loop (heapify Arr N I) N (- I 1)))

(define heapsort-extract
    Arr _ 0 -> Arr
    Arr N I ->
    (let Tmp (<-address Arr 0)
         _ (address-> Arr 0 (<-address Arr I))
         _ (address-> Arr I Tmp)
         Arr1 (heapify Arr I 0)
         (heapsort-extract Arr1 N (- I 1))))

(define heapsort
    Lst ->
    (let N (length Lst)
         Arr (list->vector Lst)
         Heap (heapsort-loop Arr N (- (div N 2) 1))
         Sorted (heapsort-extract Heap N (- N 1))
         (vector->list Sorted)))

(output "~A~%" (heapsort [12 11 13 5 6 7]))
