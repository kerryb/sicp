(define (sqrt x)
  (define (sqrt-iter guess x)
    (define next-guess (improve guess x))
    (if (good-enough? guess next-guess)
      guess
      (sqrt-iter next-guess x)))

  (define (improve guess x)
    (average guess (/ x guess)))

  (define (average x y)
    (/ (+ x y) 2))

  (define (good-enough? guess next-guess)
    (< (abs (/ (- next-guess guess)
               guess))
       0.00000001))

  (sqrt-iter 1.0 x))
