(define (for-each f items)
  (cond ((null? items) true)
        (else
          (f (car items))
          (for-each f (cdr items)))))

(for-each (lambda (x) (newline)
            (display x))
          (list 57 321 88))
