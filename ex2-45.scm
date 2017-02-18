; Dummies to allow compilation
(define (beside a b) ())
(define (below a b) ())

(define (split comb1 comb2)
  (define (f painter n)
    (if (= n 0)
      painter
      (let ((smaller (f painter (- n 1))))
        (comb1 painter (comb2 smaller smaller)))))
  f)

(define right-split (split beside below))
(define up-split (split below beside))
