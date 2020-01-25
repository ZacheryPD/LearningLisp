;;;; Chapter 5 examples
;;; Note: run this file with 'mit-scheme --quiet < c5.scm'

;; Helpers
                                        ; Print something and a newline
(define display-line
  (lambda (input)
    (display input)
    (newline)))

(define atom?
  (lambda (x)
    (and (not (pair? x))(not (null? x)))))

(define rember*
  (lambda (a l)
    (cond
     ((null? l) '())
     ((atom? (car l))
      (cond
       ((eq? (car l) a) (rember* a (cdr l)))
       (else (cons (car l) (rember* a (cdr l))))))
     (else (cons (rember* a (car l)) (rember* a (cdr l)))))))

(display "(rember* 'one '('(one two) three one)): ")
(display-line (rember* 'one '('(one two) three one)))
