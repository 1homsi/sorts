(defmodule gnome-sort
  (export (gnome-sort 1) (gnome-loop 3)))

(defun gnome-sort (lst)
  (let ((arr (list_to_tuple lst))
        (n (length lst)))
    (tuple_to_list (gnome-loop arr 0 n))))

(defun gnome-loop (arr i n)
  (cond
    ((>= i n) arr)
    ((== i 0) (gnome-loop arr 1 n))
    ('true
     (let ((ai (element (+ i 1) arr))
           (ai1 (element i arr)))
       (if (>= ai ai1)
         (gnome-loop arr (+ i 1) n)
         (let ((arr2 (setelement (+ i 1) arr ai1)))
           (gnome-loop (setelement i arr2 ai) (- i 1) n)))))))
