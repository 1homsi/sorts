(define flip
  Arr K -> (let Left 0
                Right K
                (flip-loop Arr Left Right)))

(define flip-loop
  Arr Left Right ->
    (if (< Left Right)
        (let Tmp (nth (+ Left 1) Arr)
             _ (set-nth (+ Left 1) Arr (nth (+ Right 1) Arr))
             _ (set-nth (+ Right 1) Arr Tmp)
             (flip-loop Arr (+ Left 1) (- Right 1)))
        Arr))

(define find-max-idx
  Arr Size -> (find-max-loop Arr Size 0 1))

(define find-max-loop
  Arr Size MaxIdx I ->
    (if (>= I Size)
        MaxIdx
        (if (> (nth (+ I 1) Arr) (nth (+ MaxIdx 1) Arr))
            (find-max-loop Arr Size I (+ I 1))
            (find-max-loop Arr Size MaxIdx (+ I 1)))))

(define pancake-sort
  Arr -> (sort-step Arr (length Arr)))

(define sort-step
  Arr Size -> Arr where (<= Size 1)
  Arr Size ->
    (let MaxIdx (find-max-idx Arr Size)
         Arr1 (if (not (= MaxIdx 0)) (flip Arr MaxIdx) Arr)
         Arr2 (flip Arr1 (- Size 1))
         (sort-step Arr2 (- Size 1))))

(output "~A~%" (pancake-sort [3 6 2 7 4 1 5]))
