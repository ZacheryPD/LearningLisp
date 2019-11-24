;;;; Chapter 2 examples
;; Helpers
; Print something and a newline
(define display-line
  (lambda (input)
    (display input)
    (newline)))

;;; Note: run this file with 'mit-scheme --quiet < c2.scm'

;; You can define variables using the "define" function
(define my-favorite-number 13)

;; You can define strings using double-quotes
(define my-favorite-color "green")

;; you define functions with lambdas.  Functions auto return their last line
(define my-favorites
  (lambda (color number)
    (string-append "My favorite color is " color " and my favorite number is " number)))

; display will print
; and newline prints a newline.  You must use these together for reasons I don't currently understand
(display-line
 (my-favorites my-favorite-color (number->string my-favorite-number)))

;; You can also use this shortcut to make lambdas
(define greet
  (lambda (name)
    (string-append "Hello, " name)))

(display (greet "World"))
(newline)



