(setv min-run 32)

(defn insert-val [x lst]
  (cond
    [(empty? lst) [x]]
    [(<= x (first lst)) (+ [x] lst)]
    [True (+ [(first lst)] (insert-val x (rest lst)))]))

(defn insertion-sort [lst]
  (if (empty? lst)
    lst
    (insert-val (first lst) (insertion-sort (rest lst)))))

(defn merge-runs [xs ys]
  (cond
    [(empty? xs) ys]
    [(empty? ys) xs]
    [(<= (first xs) (first ys))
     (+ [(first xs)] (merge-runs (rest xs) ys))]
    [True (+ [(first ys)] (merge-runs xs (rest ys)))]))

(defn chunks-of [n lst]
  (if (empty? lst)
    []
    (+ [(cut lst 0 n)] (chunks-of n (cut lst n None)))))

(defn merge-pairs [runs]
  (cond
    [(empty? runs) []]
    [(= 1 (len runs)) runs]
    [True (+ [(merge-runs (get runs 0) (get runs 1))]
             (merge-pairs (cut runs 2 None)))]))

(defn merge-all [runs]
  (if (= 1 (len runs))
    (first runs)
    (merge-all (merge-pairs runs))))

(defn timsort [lst]
  (if (empty? lst)
    lst
    (merge-all (list (map insertion-sort (chunks-of min-run lst))))))

(print (timsort [5 2 8 1 9 3 7 4 6]))
