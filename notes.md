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
