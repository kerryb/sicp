(define (square x)
  (* x x))

(define (sum_of_squares a b)
  (+ (square a)
     (square b)))

(define (sum_of_two_biggest_squares a b c)
  (cond ((or (> a b c)
             (> b a c))
         (sum_of_squares a b))
        ((or (> a c b)
             (> c a b))
         (sum_of_squares a c))
        (else
         (sum_of_squares b c))))
