(defun lat? (l)
  (cond
   ((null l) t)
   ((atom (car l)) (lat? (cdr l)))
   (t nil)))

(defvar l '(Jack Sprat could eat no chicken fat))

(print (lat? l))

(defun simple-search (element list)
  (if (eql (car list) element)
      t
    (simple-search element (cdr list))))

(defvar a '(1 2 3 4))

(print '(Should be true))
(print (simple-search 2 a))

(print '(Should be false))
(print (simple-search 5 a))
