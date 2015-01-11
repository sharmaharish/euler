;; 
(defun revint (n r)
	(let ((m (mod n 10)))
		(if (= 0 n)	
			r
			(revint (/ (- n m) 10) (+ (* r 10) m)))))
;; 
(defun is-palindrome (n) (and t (= (revint n 0) n)))

;;
(defun problem4 ()
	(let ((m 0))
		(do ((i 999 (if (= j 999) (1- i) i))
			 (j 999 (if (= j 100) 999 (1- j))))
			((< i 100) i)
			(let ((n (* i j)))
				(if (is-palindrome n)
					(setf m (max m n)))))
		m))
			  
