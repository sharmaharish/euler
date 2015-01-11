(use-modules (ice-9 rdelim))
(use-modules (srfi srfi-13))
(use-modules (srfi srfi-1))

(define (read-words port words)
  (let ((next (read-delimited "," port)))
    (if (eof-object? next)
        words
        (read-words port (cons (string-trim-both next char-set:punctuation) words)))))

(define (gen-list count nums)
  (if (= count 50) (reverse nums)
      (gen-list (1+ count) (cons (/ (* count (1+ count)) 2) nums))))

(define (char-position cc)
  (- 26 (- (char->integer #\Z) (char->integer (char-upcase cc)))))

(call-with-input-file "p042_words.txt"
  (lambda (port)
    (let ((checklist (gen-list 1 '())))
      (count (lambda (num) (member num checklist))
             (map (lambda (word)
                    (fold + 0 (map (lambda (cc) (char-position cc))
                                   (string->list word))))
                  (read-words port '()))))))
