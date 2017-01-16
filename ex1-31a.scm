(define (product term a next b)
  (if (> a b)
    1
    (* (term a)
       (product term (next a) next b))))

(define (identity x) x)
(define (inc n) (+ n 1))
(define (factorial n) (product identity 1 inc n))
