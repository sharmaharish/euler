;;
(defun problem3 (i f n)
	(if (eql 0 (mod i n))
		(if (primep i)
			(problem3 (1+ i) (max i f) n)
			(problem3 (1+ i) f n))
		(problem3 (1+ i) f n))
	f)
	
