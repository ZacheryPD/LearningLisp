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
     ((eq? (car lat) a) (cdr lat))
     (else (cons (car lat)
                 (rember a
                         (cdr lat)))))))

(define a 'foo)
(define lat '(bar foo bar))

(display-line (rember a lat))

(define firsts
  (lambda (list)
    (cond
     ((null? list) '())
     (else (cons (car (car list))
                 (firsts (cdr list)))))))

(define b '((foo bar) (a b) (c d)))
(display-line (firsts b))

(define insertR
  (lambda (old new lat)
    (cond
     ((null? lat) '())
     ((eq? (car lat) old) (cons
                           (car lat)
                           (cons new (cdr lat))))
     (else (cons
            (car lat)
            (insertR old new (cdr lat)))))))

(define lat '(a b d))
(define old 'b)
(define new 'c)

(display-line (insertR old new lat))


(define remove-all
  (lambda (foo lat)
    (cond
     ((null? lat) '())
     ((eq? (car lat) foo) (remove-all foo (cdr lat)))
     (else (cons (car lat) (remove-all foo (cdr lat)))))))

(define lat '(aa ab ac aa ba bb bc aa))
(define foo 'aa)

(display-line (remove-all foo lat))
