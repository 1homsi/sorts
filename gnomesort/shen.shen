(define gnome-sort
    Arr -> (let N (length Arr)
                (gnome-loop Arr 0 N)))

(define gnome-loop
    Arr I N -> Arr where (>= I N)
    Arr 0 N -> (gnome-loop Arr 1 N)
    Arr I N -> (let Ai (nth (+ I 1) Arr)
                    Ai1 (nth I Arr)
                    (if (>= Ai Ai1)
                        (gnome-loop Arr (+ I 1) N)
                        (gnome-loop (swap-at Arr I) (- I 1) N))))
