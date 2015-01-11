(load "primes.lsp")

(defparameter *number* 600851475143)
;;(defparameter *number* 13195)

(defun problem3 ()
  (let ((pl (do ((n (+ 1 (round (sqrt *number*))))
		 (m nil)	
		 (i 2 (1+ i)))
		((= i n) m)
		(if (and (= 0 (mod *number* i)) (primep i))
		    (push i m)))))
    (reduce #'max pl)))
	