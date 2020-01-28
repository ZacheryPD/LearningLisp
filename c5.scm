;;;; Chapter 5 examples
;;; Note: run this file with 'mit-scheme --quiet < c5.scm'

;; Helpers
                                        ; Print something and a newline
(define display-line
  (lambda (input)
    (display input)
    (newline)))

(define atom?
  (lambda (x)
    (and (not (pair? x))(not (null? x)))))

(define rember*
  (lambda (a l)
    (cond
     ((null? l) '())
     ((atom? (car l))
      (cond
       ((eq? (car l) a) (rember* a (cdr l)))
       (else (cons (car l) (rember* a (cdr l))))))
     (else (cons (rember* a (car l)) (rember* a (cdr l)))))))

(display-line "(rember* 'one '('(one two) three one)): ")
(display-line (rember* 'one '('(one two) three one)))

(define insertr*
  (lambda (old new lat)
    (cond
     ((null? lat) '())
     ((atom? (car lat))
      (cond
       ((eq? (car lat) old) (cons old (cons new (insertr* old new (cdr lat)))))
       (else (cons (car lat) (insertr* old new (cdr lat))))))
     (else (cons (insertr* old new (car lat)) (insertr* old new (cdr lat)))))))

(display-line "(insertr* 'foo 'bar '(foo '(foo bar) bar '(foo '(foo bar)))): ")
(display-line (insertr* 'foo 'bar '(foo '(foo bar) bar '(foo '(foo bar)))))

(define occur*
  (lambda (a lat)
    (cond
     ((null? lat) 0)
     ((atom? (car lat))
             (cond
              ((eq? (car lat) a) (+ 1  (occur* a (cdr lat))))
              (else (occur* a (cdr lat)))))
     (else (+ (occur* a (car lat)) (occur* a (cdr lat)))))))

(display "(occur* '('foo '('foo 'bar) bar)): ")
(display-line (occur* 'bar '(foo '(foo bar) bar bar)))
