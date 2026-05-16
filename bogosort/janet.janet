(defn is-sorted? [arr]
  (var sorted true)
  (loop [i :range [0 (- (length arr) 1)]]
    (when (> (arr i) (arr (+ i 1)))
      (set sorted false)))
  sorted)

(defn shuffle [arr]
  (def a (array/slice arr))
  (def n (length a))
  (loop [i :range-down [n 1]]
    (def j (math/floor (* (math/random) i)))
    (def tmp (a i))
    (set (a i) (a j))
    (set (a j) tmp))
  a)

(defn bogosort [arr]
  (var a (array/slice arr))
  (while (not (is-sorted? a))
    (set a (shuffle a)))
  a)

(def arr @[3 1 4 1 5 9 2 6])
(print (bogosort arr))
