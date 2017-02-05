; Only two changes required (see ***)

(define (make-mobile left right) (cons left right))
(define (left-branch mobile)
  (car mobile))

; *** Changed cadr to cdr here:
(define (right-branch mobile)
  (cdr mobile))

(define (make-branch length structure)
  (cons length structure))
(define (branch-length structure)
  (car structure))

; *** Changed cadr to cdr here:
(define (branch-structure structure)
  (cdr structure))

(define (branch-weight branch)
  (if (pair? (branch-structure branch))
    (total-weight (branch-structure branch))
    (branch-structure branch)))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define (balanced? mobile)
  (define left (left-branch mobile))
  (define right (right-branch mobile))
  (define (balanced-branch? branch)
    (if (pair? (branch-structure branch))
      (balanced? (branch-structure branch))
      t))
  (= (* (branch-length left)
        (branch-weight left))
     (* (branch-length right)
        (branch-weight right))))

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

(newline)
(display "Balanced? ")
(display (balanced? m))

(define l (make-branch 4 3))
(define m (make-mobile l r))
(newline)
(display "Balanced now? ")
(display (balanced? m))
