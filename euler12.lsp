;;
(defun factors (n)
  (do ((i 1 (1+ i))
       (res 0)
       (rt (1+ (isqrt n))))
      ((>= i rt) res)
    (if (= 0 (mod n i))
        (incf res 2))))
;;
(defun problem12 (fc)
  (do* ((n 1 (1+ n))
        (tn 1 (/ (* n (+ n 1)) 2))
        (afc 1 (factors tn)))
       ((> afc fc) (values n tn afc))))
;;
(time (problem12 100))
