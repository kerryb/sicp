(define (product term a next b)
  (define (iter a result)
    (if (< b a)
      result
      (iter (next a) (* result (term a)))))
  (iter a 1))

(define (identity x) x)
(define (inc n) (+ n 1))
(define (factorial n) (product identity 1 inc n))
