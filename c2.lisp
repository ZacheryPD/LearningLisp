(defun lat? (l)
  (cond
   ((null l) t)
   ((atom (car l)) (lat? (cdr l)))
   (t nil)))

(defvar l '(Jack Sprat could eat no chicken fat))

(print (lat? l))
