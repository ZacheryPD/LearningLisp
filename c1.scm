;;;; Chapter 1 notes
;; To run this file, install mit-scheme and run scheme "--quiet < c1.scm"
;; The display function can be used to print output to the screen
(display "Use the \"display\" function to print an input to the screen")
(newline)
;; An atom is a string of characters
(display "Atoms can start with anything that isn't \( or \)") (newline)
(display "Atoms can be called using the \"quote\" method, or,") (newline)
(display "apparently, a single quote") (newline)
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
 (display (car '("hello" ", " "world")))
