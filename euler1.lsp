;;
(defun problem1 ()
  (let ((ls nil))
    (dotimes (i 1000 i)
      (if (or (eql 0 (mod i 3)) (eql 0 (mod i 5)))
          (push i ls)))
    (reduce #'+ ls)))


