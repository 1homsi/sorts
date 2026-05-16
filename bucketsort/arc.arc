(def insert-sorted (x lst)
  (if (no lst) (list x)
      (<= x (car lst)) (cons x lst)
      (cons (car lst) (insert-sorted x (cdr lst)))))

(def insertion-sort (lst)
  (if (no lst) nil
      (insert-sorted (car lst) (insertion-sort (cdr lst)))))

(def get-idx (num mn mx n)
  (min (- n 1)
       (int:floor (* (/ (- num mn) (+ (- mx mn) 1)) n))))

(def bucket-sort (arr)
  (if (no arr) arr
    (let n (len arr)
         mn (apply min arr)
         mx (apply max arr)
         buckets (n-of n nil)
      (each num arr
        (let idx (get-idx num mn mx n)
          (= (nth buckets idx) (+ (nth buckets idx) (list num)))))
      (apply join (map insertion-sort buckets)))))

(prn (bucket-sort '(0.78 0.17 0.39 0.26 0.72 0.94 0.21 0.12 0.23 0.68)))
