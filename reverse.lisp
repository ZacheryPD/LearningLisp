(defun simple-reverse (input) ; A simple function to recursively reverse a list
  (if (cdr input) ; if there is a 'tail' on this list
      (append (simple-reverse (cdr input)) ; To the reversed 'tail' of the list, append...
              (list (car input))) ; ... the first element of that list (as a single-element list because the append function requires it to be so)
    input)) ; Else, it is already reversed, so just return it.

(defvar a (list 4 3 2 1)) ; To test, lets set up a new variable input

(print (simple-reverse a)) ; The reversed list should print as (1, 2, 3, 4)

(print (reverse a)) ; The default reverse method as a sanity check
