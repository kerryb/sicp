# SICP

## Installation

    brew install mit-scheme
    brew install with-readline

## Chapter 1.1.6

### Exercise 1.4

If b is positive, calculates a + b, otherwise a - b.

### Exercise 1.5

If using normal order, because x is 0 the _if_ function will return 0 and not
attempt to evaluate y. If using applicative order, the two clauses of _if_ will
both be evaluated, which will result in infinite recursion as the definition of
_p_ refers to itself.

## Chapter 1.1.7

### Exercise 1.6

This will also cause infinite recursion, because every time it is called it
will attempt to evaluate both sides of the _if_, including the recursive call
in the _else_ clause. This means that even when it reaches the terminating
condition, it still calls itself one more time. And then that call also calls
itself one more time ...

### Exercise 1.7

Very small numbers will be declared good enough when comparatively miles away.
For example, sqrt 0.000000001 = 0.0000316227766, which means that an easily
"good enough" guess of 0.0001 would actually be an order of magnitude or two
out.

For very large numbers, limited precision could prevent the number ever getting
"close enough". For example, sqrt 1E20 = 1E10. If we only had 10-digit
accuracy, we wouldn't have enough precision to represent 10,000,000.001, which
would keep getting rounded to 10,000,000.

## Lecture 1B

"The key to understanding complicated things is to know what not to look at,
and what not to compute, and what not to think"

If: predicate/consequent/alternative

"It's important to get names for the parts of things"

Recursive definition of +

Shapes of expanded algorithms in terms of time and space

Iteration and recursion in terms of passing requests between people

## Chapter 1.2.1

Interesting that "linear recursive" and "iterative" solutions are _both_
recursive. But the latter finishes with a simple call to itself, which
presumably is where TCO comes in.

Languages having to resort to for, while etc for iteration described as a
"defect" :-)

### Exercise 1.9

The first process is recursive:

```scheme
(define (+ a b)
  (if (= a 0) b (inc (+ (dec a) b))))

(+ 4 5)
(inc (+ 3 5))
(inc (inc (+ 2 5)))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9
```

The second is iterative:

```scheme
(define (+ a b)
  (if (= a 0) b (+ (dec a) (inc b))))

(+ 4 5)
(+ 3 6)
(+ 2 7)
(+ 1 8)
(+ 0 9)
9
```

### Exercise 1.10

```scheme
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

(A 1 10)
(A (- 1 1) (A 1 (- 10 1)))
(A 0 (A 1 9))
(A 0 (A (- 1 1) (A 1 (- 9 1))))
(A 0 (A 0 (A 1 8)))
(A 0 (A 0 (A 0 (A 1 7))))
(A 0 (A 0 (A 0 (A 0 (A 1 6))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))
(A 0 (A 0 (A 0 (A 0 (A 0 32)))))
(A 0 (A 0 (A 0 (A 0 64))))
(A 0 (A 0 (A 0 128)))
(A 0 (A 0 256))
(A 0 512)
1024

(A 2 4)
(A 1 (A 2 3))
(A 1 (A 1 (A 2 2)))
(A 1 (A 1 (A 1 (A 2 1)))
(A 1 (A 1 (A 1 2))
(A 1 (A 1 4)
(A 1 16)
65536

(A 3 3)
;Value: 65536
```

```scheme
(define (f n) (A 0 n))
```

2n

```scheme
(define (g n) (A 1 n))
```

2^n

```scheme
(define (h n) (A 2 n))
```

If n = 1, 2^n; if n = 2, 2^(2^n); if n = 3, 2^(2^(2^n)). Or something like that.

## Lecture 2A

"Whenever you find yourself writing something down more than once, there's
something wrong and you shouldn't be doing it."

## Chapter 2.2.1

Really starting to miss pattern-matching at this point.

## Chapter 2.2.2

And now I miss the Elixir |> operator too. I expect I need to define a monad macro or something.

### Exercise 2.24

(1 (2 (3 4)))

+-------+   +-------+
|   |   |   |   |  /|
| 1 | +---->+ + | / |
|   |   |   | | |/  |
+-------+   +-------+
              |
              V
            +-------+   +-------+
            |   |   |   |   |  /|
            | 2 | +---->+ + | / |
            |   |   |   | | |/  |
            +-------+   +-------+
                          |
                          V
                        +-------+   +-------+
                        |   |   |   |   |  /|
                        | 3 | +---->+ 4 | / |
                        |   |   |   |   |/  |
                        +-------+   +-------+

(1 (2 (3 4)))
     +
     |
  +--+--+
  |     |(2 (3 4))
  +  +-----+
  1  |     |(3 4)
     +  +-----+
     2  |     |
        +     +
        3     4

## Exercise 2.26

(define x (list 1 2 3))
(define y (list 4 5 6))

(append x y) => (1 2 3 4 5 6)
(cons x y) => ((1 2 3) 4 5 6)
(list x y) => ((1 2 3) (1 2 3))

## Exercise 2.38

`op` must be commutative.
