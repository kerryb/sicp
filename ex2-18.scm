(define (reverse l)
  (define (_reverse l result)
    (if (null? l)
      result
      (_reverse (cdr l)
                (cons (car l) result))))
  (_reverse l (list)))
