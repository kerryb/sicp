(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (make-vector x y) (cons x y))
(define (x-vector v) (car v))
(define (y-vector v) (cdr v))

(define (circum-rect rect)
  (* 2
     (+ (width-rect rect)
        (height-rect rect))))

(define (area-rect rect)
  (* (width-rect rect)
     (height-rect rect)))

(define (test)
  (newline)
  (display "2 x 3 rectangle: circumference is ")
  (display (circum-rect rect))
  (display " and area is ")
  (display (area-rect rect)))

; First implementation of rectangle

(define (make-rect x y dx dy)
  (cons (make-point x y) (make-vector dx dy)))
(define (origin rect) (car rect))
(define (dimensions-rect rect) (cdr rect))
(define (width-rect rect)
  (car (dimensions-rect rect)))
(define (height-rect rect)
  (cdr (dimensions-rect rect)))

(define rect
  (make-rect 5 4 2 3))

(test)

; Second implementation of rectangle

(define (make-rect x1 y1 x2 y2)
  (cons (make-point x1 y1) (make-point x2 y2)))
(define (origin rect) (car rect))
(define (other-corner rect) (cdr rect))
(define (width-rect rect)
  (abs (- (car (origin rect))
          (car (other-corner rect)))))
(define (height-rect rect)
  (abs (- (cdr (origin rect))
          (cdr (other-corner rect)))))

(define rect
  (make-rect 5 4 7 7))

(test)
