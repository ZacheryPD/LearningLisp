;;;; Chapter 2 examples
;;; Note: run this file with 'mit-scheme --quiet < c2.scm'

;; Helpers
; Print something and a newline
(define display-line
  (lambda (input)
    (display input)
    (newline)))

(define atom?
  (lambda (x)
    (and
     (not (pair? x))
     (not (null? x)))))

;; You can define variables using the "define" function
(define my-favorite-number 13)

;; You can define strings using double-quotes
(define my-favorite-color "green")

;; you define functions with lambdas.
; Functions auto return their last line
(define my-favorites
  (lambda (color number)
    (string-append "My favorite color is " color " and my favorite number is " number)))

;; Calling functions
; You can call a function by creating list where the parameters follow
; the function name in the list
(display-line
 (my-favorites my-favorite-color (number->string my-favorite-number)))

(define lat?
  (lambda (l)
    (cond
     ((null? l) #t)
      ((atom? (car l)) (lat? (cdr l)))
      ; you can replace else with #t if you want
      (else #f))))

(display "(lat? '('Is' 'this' 'a' 'list')): ")
(display-line
 (lat? '("Is" "this" "a" "list?")))

(display "(lat? '()): ")
(display-line
 (lat? '()))

(display "(lat? '(1 2 '(1 2 3))): ")
(display-line
 (lat? '(1 2 '(1 2 3))))

;; my own implementation of member
; Note the usage of equal? instead of eq.
; For some reason, eq is undefined on strings
; (define member?
;   (lambda (target list)
;     (cond
;      ((null? list) #f)
;      ((equal? target (car list)) #t)
;      (else (member? target (cdr list))))))

(define member?
  (lambda (target source)
    (cond
     ((null? source) #f)
     (else (or (eq? target (car source))
               (member? target (cdr source)))))))

(define target 'is)
(define target-list '(is that in this list?))

(display-line (member? target target-list))
