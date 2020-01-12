;;;; Chapter 4 examples
;;; Note: run this file with 'mit-scheme --quiet < c4.scm'

;; Helpers
                                        ; Print something and a newline
(define display-line
  (lambda (input)
    (display input)
    (newline)))

;; Chapter-specific helpers

; A method that adds one to the number given
(define add1
 (lambda (n)
   (+ n 1)))
(display "5 + 1: ")
(display-line (add1 5))

; A method that subtracts one from the number given
(define sub1
  (lambda (n)
    (- n 1)))
(display "5 - 1: ")
(display-line (sub1 5))

; A method that adds two integers
(define add
  (lambda (a b)
    (cond
     ((zero? b) a)
     (else (add1 (add a (sub1 b)))))))
(display "5 + 6: ")
(display-line (+ 5 6))

; A method that subtracts two integers
(define sub
  (lambda (a b)
    (cond
     ((zero? b) a)
      (else (sub1 (sub a (sub1 b)))))))
(display "5 - 4: ")
(display-line (sub 5 4))
