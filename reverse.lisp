(defun simple-reverse (input) ; A simple function to recursively reverse a list
  (if (cdr input) ; If the input is a list of at least length 2,
      (append (simple-reverse (cdr input)) ; To the reversed 'tail' of the list ...
              (list (car input))) ; ... Append the first element of that list
    input)) ; Else, it is already reversed.

(defvar a (list 4 3 2 1)) ; To test, lets set up a new variable input

(print (simple-reverse a)) ; The reversed list should print as (1, 2, 3, 4)

(print (reverse a)) ; The default reverse method as a sanity check
