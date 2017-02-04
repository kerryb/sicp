(define (cc amount coin-values)
  (define first-denomination car)
  (define except-first-denomination cdr)
  (define no-more? null?)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
          (+ (cc amount
                 (except-first-denomination
                   coin-values))
             (cc (- amount
                    (first-denomination
                      coin-values))
                 coin-values)))))
