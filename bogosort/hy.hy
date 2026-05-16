(import random)

(defn is-sorted [arr]
  (all (map (fn [[a b]] (<= a b))
            (zip arr (cut arr 1 None)))))

(defn shuffle [arr]
  (setv a (list arr))
  (random.shuffle a)
  a)

(defn bogosort [arr]
  (setv a (list arr))
  (while (not (is-sorted a))
    (setv a (shuffle a)))
  a)

(print (bogosort [3 1 4 1 5 9 2 6]))
