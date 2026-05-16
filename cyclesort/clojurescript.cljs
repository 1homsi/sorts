(defn cycle-sort [arr]
  (let [a (js/Array. 5 4 3 2 1)
        n (.-length a)]
    (dotimes [cycle-start (dec n)]
      (let [item (aget a cycle-start)
            pos (atom cycle-start)]
        (doseq [i (range (inc cycle-start) n)]
          (when (< (aget a i) item) (swap! pos inc)))
        (when (not= @pos cycle-start)
          (while (= item (aget a @pos)) (swap! pos inc))
          (let [tmp (aget a @pos)]
            (aset a @pos item)
            (atom tmp))
          (while (not= @pos cycle-start)
            (reset! pos cycle-start)
            (doseq [i (range (inc cycle-start) n)]
              (when (< (aget a i) item) (swap! pos inc)))
            (while (= item (aget a @pos)) (swap! pos inc))
            (let [v (aget a @pos)]
              (aset a @pos item))))))
    a))

(.log js/console (cycle-sort nil))
