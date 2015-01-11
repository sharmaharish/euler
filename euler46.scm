(load "utility.scm")

(define (find-smallest-odd-composite n)
  (cond ((or (is-prime n) (test-conjencture n)) (find-smallest-odd-composite (+ n 2)))
        (else (display n) (newline))))

(define (test-conjencture n)
  (cond ((even? n) #f)
        ((< n 9) #f)
        (else (test-conjencture-impl n (prev-prime n)))))

(define (test-conjencture-impl n p)
  (cond ((< p 2) #f)
        (else
         (let ((sq (/ (- n p) 2)))
           (cond ((integer? (sqrt sq)) #t)
                 (else (test-conjencture-impl n (prev-prime p))))))))

(find-smallest-odd-composite 9)
