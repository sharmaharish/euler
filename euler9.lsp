;;
(defun problem9 ()
  (do ((a 1 (1+ a)))
      ((> a 1000))
    (do ((b 1 (1+ b)))
        ((> b 1000))
      (do ((c 1 (1+ c)))
          ((> c 1000))
        (if (and (< a b c) (= 1000 (+ a b c)) (= (* c c) (+ (* a a) (* b b))))
            (progn (format t "~A ~A ~A" a b c)
                   (setf a 1001 b 1001 c 1001)))))))


