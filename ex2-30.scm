(define (square-tree-1 tree)
  (cond ((null? tree) ())
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree-1 (car tree))
                    (square-tree-1 (cdr tree))))))

(define (square-tree-2 tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
           (square-tree-2 sub-tree)
           (square sub-tree)))
       tree))

(define result
  (square-tree-1
    (list 1
          (list 2 (list 3 4) 5)
          (list 6 7))))

(newline)
(display result)

(define result
  (square-tree-2
    (list 1
          (list 2 (list 3 4) 5)
          (list 6 7))))

(newline)
(display result)
