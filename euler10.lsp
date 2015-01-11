;;
(defun primep (n)
  (case n
    ((2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53) t)
    (t (cond ((or (= 0 (mod n 3)) (= 0 (mod n 5)) (= 0 (mod n 7))) nil)
             (t (do ((tn (+ (round (sqrt n)) 1))
                     (i 2 (1+ i))
                     (result t))
                    ((> i tn) result)
                  (if (= 0 (mod n i))
                      (setf i (+ tn 1) result nil))))))))
;;
(defun problem10 (n)
  (do ((i 3 (+ i 2))
       (ps 2))
      ((> i n) ps)
    (if (primep i) (incf ps i))))
