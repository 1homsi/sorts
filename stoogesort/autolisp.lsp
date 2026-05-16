(defun stooge-sort (arr first last / tmp t n)
    (if (> (nth first arr) (nth last arr))
        (progn
            (setq tmp (nth first arr))
            (setq arr (subst (nth last arr) (nth first arr) arr))
            (setq arr (subst tmp (nth last arr) arr))))
    (setq n (- last first -1))
    (if (> n 2)
        (progn
            (setq t (/ (* n 2) 3))
            (setq arr (stooge-sort arr first (+ first t -1)))
            (setq arr (stooge-sort arr (- last t -1) last))
            (setq arr (stooge-sort arr first (+ first t -1)))))
    arr)

(setq arr '(3 1 4 1 5 9 2 6))
(setq arr (stooge-sort arr 0 7))
(princ arr)
