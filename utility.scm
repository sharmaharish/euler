;;(library (utility (1 0))
;;  (export is-prime prev-prime next-prime count-digits is-pandigital))

;; todos
;; - add primes-between
;; - add permutations
;; - add combinations

(define (is-prime num)
  (cond ((< num 2) #f)
        ((= num 2) #t)
        ((= num 3) #t)
        ((= num 5) #t)
        ((= num 7) #t)
        (else (and (> num 7) (is-prime-impl num (truncate (sqrt num)) 3)))))

(define (is-prime-impl num lmt check)
  (cond ((> check lmt) #t)
        ((= 0 (remainder num check)) #f)
        (else (is-prime-impl num lmt (+ check 2)))))

;; todo handle boundary case num < 2
(define (prev-prime num)
  (cond ((<= num 2) 0)
        ((= num 3) 2)
        ((even? num) (gen-prime (- num 1) -1))
        (else (gen-prime (- num 2) -1))))

(define (next-prime num)
  (cond ((= num 1) 2)
        ((even? num) (gen-prime (1+ num) 1))
        (else (gen-prime (+ num 2) 1))))

(define (gen-prime num dir)
  (if (is-prime num) num
      (gen-prime (+ num (* 2 dir)) dir)))

(define (primes-under num)
  (define (impl num start primes-list)
    (let ((next (next-prime start)))
      (if (< next num) (impl num next (cons next primes-list))
          (reverse primes-list))))
  (impl num 1 '()))

(define (count-digits num)
  (define (impl n c)
    (if (= 0 n) c
        (impl (quotient n 10) (1+ c))))
  (impl (abs num) 0))

(define (is-pandigital num)
  (define (get-flags n flags)
    (if (= n 0) flags
        (get-flags
         (quotient n 10)
         (logior flags (ash #b1 (max 0 (1- (remainder n 10))))))))
  (= (get-flags num 0) (1- (ash #b1 (count-digits num)))))
