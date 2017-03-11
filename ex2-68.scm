(load "huffman.scm")

(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
            (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (define (encode-symbol-1 symbol tree bits)
    (cond ((leaf? tree)
           (reverse bits))
          ((memq symbol (symbols (left-branch tree)))
                 (encode-symbol-1 symbol
                                  (left-branch tree)
                                  (cons 0 bits)))
          ((memq symbol (symbols (right-branch tree)))
                 (encode-symbol-1 symbol
                                  (right-branch tree)
                                  (cons 1 bits)))
          (else
            (error "bad symbol: ENCODE-SYMBOL" symbol))))
  (encode-symbol-1 symbol tree '()))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                    (make-leaf 'B 2)
                    (make-code-tree
                      (make-leaf 'D 1)
                      (make-leaf 'C 1)))))

(newline)
(write (encode '(a d a b b c a) sample-tree))

; => (0 1 1 0 0 1 0 1 0 1 1 1 0)

