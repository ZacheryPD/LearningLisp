;;;; Chapter 2 examples

;;; lat?
(defun lat? (l)
  (cond
   ((null? l) #t
    ((atom? (car l) (lat?(crd l)))
     (else #f)))))

(print (lat? '(bacon and eggs)))
