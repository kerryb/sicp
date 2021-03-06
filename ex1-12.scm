; Pretty sure this isn't really what they were asking for, particularly as we
; haven't learnt about lists yet.

(define (pascal-row n)
  (define (next-row row)
    (next-row~ row (list 1)))

  (define (next-row~ remainder result)
    (cond ((= (length remainder) 0) result)
          ((= (length remainder) 1) (cons 1 result))
          (else (next-row~ (cdr remainder)
                           (cons (+ (car remainder)
                                    (car (cdr remainder)))
                                 result)))))

  (if (= n 1)
      (list 1)
      (next-row (pascal-row (- n 1)))))
