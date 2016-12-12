(define (cube-root x)
  (define (cube-root-iter guess x)
    (define next-guess (improve guess x))
    (if (good-enough? guess next-guess)
      guess
      (cube-root-iter next-guess x)))

  (define (improve guess x)
    (/ (+ (/ x
             (square guess))
          (* 2 guess))
       3))

  (define (good-enough? guess next-guess)
    (< (abs (/ (- next-guess guess)
               guess))
       0.00000001))

  (cube-root-iter 1.0 x))
