(defun cycle-sort (lst / n arr writes cycle-start item pos i tmp)
  (setq n (length lst)
        arr (vl-list->array lst)
        writes 0
        cycle-start 0)
  (while (< cycle-start (1- n))
    (setq item (aref arr cycle-start)
          pos cycle-start
          i (1+ cycle-start))
    (while (< i n)
      (if (< (aref arr i) item) (setq pos (1+ pos)))
      (setq i (1+ i)))
    (if (/= pos cycle-start)
      (progn
        (while (= item (aref arr pos)) (setq pos (1+ pos)))
        (setq tmp (aref arr pos))
        (aset arr pos item)
        (setq item tmp
              writes (1+ writes))
        (while (/= pos cycle-start)
          (setq pos cycle-start
                i (1+ cycle-start))
          (while (< i n)
            (if (< (aref arr i) item) (setq pos (1+ pos)))
            (setq i (1+ i)))
          (while (= item (aref arr pos)) (setq pos (1+ pos)))
          (setq tmp (aref arr pos))
          (aset arr pos item)
          (setq item tmp
                writes (1+ writes)))))
    (setq cycle-start (1+ cycle-start)))
  (array->list arr))

(princ (cycle-sort '(5 4 3 2 1)))
