(define (sum term a next b)
  (define (iter a result)
    (if (< b a)
      result
      (iter (next a) (+ result (term a)))))
  (iter a 0))
