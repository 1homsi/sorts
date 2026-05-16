(define (timsort arr minSize)
  (mergesort arr minSize))

(define (mergesort arr minSize)
  (cond
    ((<= (length arr) 1) arr)
    ((<= (length arr) minSize) (insertionsort arr))
    (else
      (let ((mid (quotient (length arr) 2)))
        (merge
          (mergesort (take arr mid) minSize)
          (mergesort (drop arr mid) minSize))))))

(define (take lst n)
  (if (or (= n 0) (null? lst))
    '()
    (cons (car lst) (take (cdr lst) (- n 1)))))

(define (drop lst n)
  (if (or (= n 0) (null? lst))
    lst
    (drop (cdr lst) (- n 1))))

(define (insertionsort arr)
  (define (iter result i)
    (if (>= i (length result))
      result
      (iter (insert-elem (list-ref result i) result i) (+ i 1))))
  (iter arr 1))

(define (insert-elem key arr pos)
  (let ((j (- pos 1)))
    (if (or (< j 0) (<= key (list-ref arr j)))
      arr
      (cons (list-ref arr j) (insert-elem key (remove arr (+ j 1)) j)))))

(define (merge left right)
  (cond
    ((null? left) right)
    ((null? right) left)
    ((<= (car left) (car right))
     (cons (car left) (merge (cdr left) right)))
    (else
     (cons (car right) (merge left (cdr right))))))

(display (timsort '(5 2 8 1 9 3) 32))
(newline)
