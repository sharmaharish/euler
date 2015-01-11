(load "utility.scm")

(define (largest-pandigital num)
  (let ((prime (prev-prime num)))
    (if (is-pandigital prime) prime
        (largest-pandigital prime))))

(largest-pandigital 7654321)
