;;;; Chapter 6 examples
;;; Note: run this file with 'mit-scheme --quiet < c6.scm'

;;; Helpers
;; Print something and a newline
(define display-line
  (lambda (input)
    (display input)
    (newline)))

(define atom?
  (lambda (x)
    (and (not (pair? x))(not (null? x)))))

;; The goal is to identify cases where the first position is a number, the
;; second position is one of x, +, ^, -, or / and the third position is a
;; number. The more complete draft of the book assumes that you only use the
;; right operators and moves on with life.
(define numbered?
  (lambda (aexp)
    (cond
     ((atom? aexp) (number?  aexp))
     (else
      (and
       (numbered? (car aexp))
       (numbered? (car (cdr (cdr aexp)))))))))

(display "(numbered? '(1 + 2)): ")
(display-line (numbered? '(1 + 2)))

(display "(numbered? '(1 2 3)): ")
(display-line (numbered? '(1 2 3)))

(display "(numbered? '(a b c)): ")
(display-line (numbered? '(a b c)))
