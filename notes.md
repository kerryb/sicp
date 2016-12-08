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
