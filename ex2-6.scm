(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; (define 1 (add-1 zero))
; (define 1 (lambda (f) (lambda (x) (f ((zero f) x)))))
(define one (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x)))))

; (define two (add-1 one))
; (define two (lambda (f) (lambda (x) (f ((one f) x)))))
(define two (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x)))) f) x)))))
