(define (make-mobile left right)
  (list left right))
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (cadr mobile))

(define (make-branch length structure)
  (list length structure))
(define (branch-length structure)
  (car structure))
(define (branch-structure structure)
  (cadr structure))

(define (total-weight mobile)
  (define (branch-weight branch)
    (if (pair? (branch-structure branch))
      (total-weight (branch-structure branch))
      (branch-structure branch)))
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

; Test/demo thing … I should really look into scheme unit testing.

(define l2 (make-branch 3 1))
(define r2 (make-branch 1 3))
(define m2 (make-mobile l2 r2))
(define l (make-branch 4 2))
(define r (make-branch 2 m2))
(define m (make-mobile l r))

(newline)
(display "Weight of right submobile: ")
(display (total-weight m2))
(newline)
(display "Total weight: ")
(display (total-weight m))
