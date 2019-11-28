;;;; Chapter 3 examples
;;; Note: run this file with 'mit-scheme --quiet < c3.scm'

;; Helpers
                                        ; Print something and a newline
(define display-line
  (lambda (input)
    (display input)
    (newline)))

(define rember
  (lambda (a lat)
    (cond
     ((null? lat) '())
     (else (cond
            ((eq? (car lat) a) (cdr lat))
            (else (cons (car lat)
                        (rember a
                                (cdr lat)))))))))

(define a 'foo)
(define lat '(bar foo bar))

(display-line (rember a lat))
