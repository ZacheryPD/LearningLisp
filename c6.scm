;;;; Chapter 6 examples
;;; Note: run this file with 'mit-scheme --quiet < c6.scm'

;; Helpers
                                        ; Print something and a newline
(define display-line
  (lambda (input)
    (display input)
    (newline)))

(define atom?
  (lambda (x)
    (and (not (pair? x))(not (null? x)))))
