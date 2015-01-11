(use-modules (ice-9 format))

(define (pentagonal? n)
  (let ((t (/ (+ (sqrt (+ (* 24 n) 1)) 1) 6)))
    (integer? t)))

(define (check-pair m n)
  (and (pentagonal? m) (not (null? n)) (pentagonal? n)))

(define (gen-pentagonal n)
  (define (impl b pn)
    (if (< b n)
        (impl (1+ b) (cons (/ (* b (- (* 3 b) 1)) 2) pn))
        pn))
  (reverse! (impl 1 '())))

(define (find-pair pnos)
  (define (impl t ps)
    (cond ((null? ps) #f)
          ((check-pair (+ t (car ps)) (abs (- t (car ps))))
           (format #t "~d,~d~%" t (car ps))
           #t)
          (else (impl t (cdr  ps)))))
  (if (not (or (null? pnos) (null? (cdr pnos))))
      (if (not (impl (car pnos) (cdr pnos)))
          (find-pair (cdr pnos)))))