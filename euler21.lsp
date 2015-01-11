;; finds proper divisors of a given no.
(defun factors (n)
  (do ((i 2 (1+ i))
       (half (/ n 2))
       (fl 1))
      ((> i half) fl)
    (if (= 0 (mod n i))
        (incf fl i))))

;;
(defun has-amicable-pair (b)
  (let ((a (factors b)))
    (if (/= a b)
        (if (= (factors a) b)
            a
            nil))))

;;
(defun sum-amicable-pairs (n)
  (do* ((i 2 (1+ i))
        (ap (has-amicable-pair i) (has-amicable-pair i))
        (sap 0))
       ((> i n) sap)
    (if ap (incf sap ap))))



