(defmodule quicksort
  (export (sort 1) (main 0)))

(defun sort
  (('()) '())
  (((cons pivot rest))
   (let ((left (lists:filter (lambda (x) (=< x pivot)) rest))
         (right (lists:filter (lambda (x) (> x pivot)) rest)))
     (++ (sort left) (list pivot) (sort right)))))

(defun main ()
  (let ((sorted (sort '(3 6 8 10 1 2 1))))
    (lists:foreach (lambda (x) (io:format "~p~n" (list x))) sorted)))
