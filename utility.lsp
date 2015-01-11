;;
(defun primep (n)
  (case n
    ((2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 57) t)
    (t (do ((tn (+ (round (sqrt n)) 1))
            (i 2 (1+ i))
            (result t))
           ((> i tn) result)
         (if (= 0 (mod n i))
             (setf i (+ tn 1) result nil))))))
;;
(defun nth-prime (n)
  (case n
    (1 2) (2 3) (3 5) (4 7) (5 11) (6 13) (7 17) (8 19)
    (t (do ((c 8 (+ c 0))
            (i 21 (+ i 2)))
           ((= c n) (- i 2))
         (if (primep i) (incf c))))))
;;
(defun prime-sieve (n)
  (let ((sieve (make-array n :initial-element 1)))
    (setf (aref sieve 0) 0)
    (labels ((mark-multiples (m)
               (do* ((i 2 (1+ i))
                     (j (* i m) (* i m)))
                    ((> j n) i)
                 (setf (aref sieve (- j 1)) 0))))
      (do ((i 2 (1+ i)))
          ((> i n) sieve)
        (if (/= 0 (aref sieve (- i 1)))
            (mark-multiples i))))))
;;
(defun primes-under (n &optional (ps (prime-sieve n)))
  (labels ((impl (n i pl)
             (cond ((= i n) pl)
                   ((= 0 (aref ps i)) (impl n (1+ i) pl))
                   (t (impl n (1+ i) (cons (+ i 1) pl))))))
    (reverse (impl n 0 nil))))
;;
(defun is-prime (n sieve)
  (= 1 (aref sieve (- n 1))))