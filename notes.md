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
