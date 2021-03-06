(define (adjoin-set x set)
  (define (insert-between-sets set1 x set2)
    (cond ((null? set2)
           (reverse (cons x set1)))
          ((= x (car set2))
           (append (reverse set1) set2))
          ((< x (car set2))
           (append (reverse set1) (cons x set2)))
          (else
            (insert-between-sets (cons (car set2) set1) x (cdr set2)))))
  (insert-between-sets '() x set))
