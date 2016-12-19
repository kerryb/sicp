; Recursive implementation
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2
            (f (- n 2)))
         (* 3
            (f (- n 3))))))

; Iterative implementation of the same thing
(define (f2 n)
  (define (f2-iter a b c n)
    (if (= n 0)
        c
        (f2-iter b
                 c
                 (+ (* 3 a)
                        (* 2 b)
                        c)
                 (- n 1))))
  (if (< n 3)
      n
      (f2-iter 0 1 2 (- n 2))))
