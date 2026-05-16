(define cocktail-sort-forward
  Arr Start End Swapped ->
    (if (>= Start End)
        [Arr Swapped]
        (let A (vector-> Arr Start)
             B (vector-> Arr (+ Start 1))
          (if (> A B)
              (do (vector-> Arr Start B)
                  (vector-> Arr (+ Start 1) A)
                  (cocktail-sort-forward Arr (+ Start 1) End true))
              (cocktail-sort-forward Arr (+ Start 1) End Swapped)))))

(define cocktail-sort-backward
  Arr Start End Swapped ->
    (if (< End Start)
        [Arr Swapped]
        (let A (vector-> Arr End)
             B (vector-> Arr (+ End 1))
          (if (> A B)
              (do (vector-> Arr End B)
                  (vector-> Arr (+ End 1) A)
                  (cocktail-sort-backward Arr Start (- End 1) true))
              (cocktail-sort-backward Arr Start (- End 1) Swapped)))))

(define cocktail-sort-loop
  Arr false _ _ -> Arr
  Arr true Start End ->
    (let [Arr1 Sw1] (cocktail-sort-forward Arr Start End false)
      (if (= Sw1 false)
          Arr1
          (let [Arr2 Sw2] (cocktail-sort-backward Arr1 Start (- End 1) false)
            (cocktail-sort-loop Arr2 Sw2 (+ Start 1) (- End 1))))))

(define cocktail-sort
  Lst -> (let N (length Lst)
              Arr (list->vector Lst)
           (vector->list (cocktail-sort-loop Arr true 0 (- N 1)))))
