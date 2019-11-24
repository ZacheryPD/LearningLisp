;;;; Chapter 1 notes
;; To run this file, install mit-scheme and run scheme "--quiet < c1.scm"


;; Helpers
; Print something and a newline
(define display-line
  (lambda (input)
    (display input)
    (newline)))

;; The display function can be used to print output to the screen
(display-line "Use the \"display\" function to print an input to the screen")
;; An atom is a string of characters
(display-line "Atoms can start with anything that isn't \( or \)")
(display-line "Atoms can be called using the \"quote\" method, or,")
(display-line "apparently, a single quote")
(quote atom)
'atom

;; A list is the other basic unit
; A list is an atom, or multiple atoms enclosed by parentheses
(quote (atom)) ; a single atom enclosed by parentheses
'(another) ; another single atom enclosed by parentheses
'(1 2 3)

;; car
; The car function takes a list and returns the head of the list
; (car '(1 2 3))
(display "Car result: ")
(display-line (car '("hello" ", " "world")))


;; cdr
; Takes a list, returns the "rest" of that list
; Must not be an empty list
(define cdr-input '(1 2 3 4))
(define cdr-result (cdr cdr-input))

(display "Cdr result: ")
(display-line cdr-result)

;; cons
; Appends something to the start of a list
(define cons-target '(2 3 4))
(define cons-1 1)
(define cons-result (cons cons-1 cons-target))

(display "Cons result: ")
(display-line cons-result)

;; null?
; A function returning #t when the given input is null

(display "null? '(): ")
(display-line (null? '()))
