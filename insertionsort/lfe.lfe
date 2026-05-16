(defmodule insertion-sort
  (export (sort 1) (insert 2)))

(defun insert
  ([x '()] `(,x))
  ([x `(,h . ,t)]
   (if (<= x h)
       `(,x ,h ,@t)
       `(,h ,@(insert x t)))))

(defun sort
  (['()] '())
  ([`(,h . ,t)] (insert h (sort t))))
