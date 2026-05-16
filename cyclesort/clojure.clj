(defn cycle-sort [arr]
  (let [a (int-array arr)
        n (count arr)]
    (dotimes [cycle-start (dec n)]
      (let [item (aget a cycle-start)
            pos (atom cycle-start)]
        (doseq [i (range (inc cycle-start) n)]
          (when (< (aget a i) item) (swap! pos inc)))
        (when (not= @pos cycle-start)
          (while (= item (aget a @pos)) (swap! pos inc))
          (let [item-ref (atom item)]
            (aset a @pos item)
            (let [tmp (aget a @pos)]
              (reset! item-ref tmp))
            (while (not= @pos cycle-start)
              (reset! pos cycle-start)
              (doseq [i (range (inc cycle-start) n)]
                (when (< (aget a i) @item-ref) (swap! pos inc)))
              (while (= @item-ref (aget a @pos)) (swap! pos inc))
              (let [v (aget a @pos)]
                (aset a @pos @item-ref)
                (reset! item-ref v)))))))
    (vec a)))

(println (cycle-sort [5 4 3 2 1]))
