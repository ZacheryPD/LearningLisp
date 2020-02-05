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

;; The goal is to identify cases where the first position is a number
;; The second position is one of x, +, ^, -, or /
;; and the third position is a number
;; A very bad draft
(define numbered?
  (lambda (exp)
    (cond
     ;; If the first place is an atom & number
     ;; & the second place is +
     ;; & the 3rd place is an atom & a number
     ((and
       (atom? (car exp))
       (and
        (number? (car exp))
        (and
         (eq? (car (cdr exp)) (quote +))
         (and
          (atom? (car (cdr (cdr exp))))
          (number? (car (cdr (cdr exp))))))))
      #t)
     (else #f))))

(display-line (numbered? '(1 + 2)))
