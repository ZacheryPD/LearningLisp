(defun lat? (l)
  (cond
   ((null l) t)
   ((atom (car l)) (lat? (cdr l)))
   (t nil)))

(defvar l '(Jack Sprat could eat no chicken fat))

(print (lat? l))

(defun simple-search (element list) ;A simple search method that traverses the list looking for 'element'
  (cond ;There are more than two cases, so we need a cond instead of an if
   ((eql (car list) element) t) ;If the head of the list is the element we are looking for, return true
   ((cdr list) (simple-search element (cdr list))) ;If there is more to the list, search the rest of the list.
   (t ()))) ;If there is no more to the list, return an empty list signifying that the element was not found.

(defvar a '(1 2 3 4))

(print '(Should be true))
(print (simple-search 2 a))

(print '(Should be false))
(print (simple-search 5 a))
