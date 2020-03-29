;;;; Chapter 7 notes
;; To run this file, install mit-scheme and run "scheme --quiet < c7.scm"

;; Helpers
; Print something and a newline
(define display-line
  (lambda (input)
    (display input)
    (newline)))

(define multirember
  (lambda (a lat)
    (cond
     ((null? lat) '())
     ((equal? a (car lat)) (multirember a (cdr lat)))
     (else (cons (car lat) (multirember a (cdr lat)))))))

(define atom?
  (lambda (x)
    (and (not (pair? x))(not (null? x)))))

(define member?
  (lambda (target source)
    (cond
     ((null? source) #f)
     (else (or (equal? target (car source))
               (member? target (cdr source)))))))

(define set?
  (lambda (set)
    (cond
     ((null? set) #t)
     ((member? (car set) (cdr set)) #f)
     (else (set? (cdr set))))))

(display "set? (one two three one): ")
(display-line (set? '(one two three one)))
(display "set? (one two three): ")
(display-line (set? '(one two three)))

(define makeset
  (lambda (lat)
    (cond
     ((null? lat) '())
     ((member? (car lat) (cdr lat)) (makeset (cdr lat)))
     (else (cons (car lat) (makeset (cdr lat)))))))

(display "makeset: one two one three one four: ")
(display-line (makeset '(one two one three one four)))

(define makeset-rember
  (lambda (lat)
    (cond
     ((null? lat) '())
     (else
      (cons
       (car lat)
       (makeset-rember (multirember (car lat) (cdr lat))))))))

(display "makeset-rember: one two one three one four")
(display-line (makeset-rember'(one two one three one four)))

(define subset
  (lambda (s1 s2)
    (cond
     ((or (null? s1) (null? s2)) #t) ; The second part of the or (null? s2) is not necessary, but that case is
                                        ; handled in side 'member I think this is the member function leaking its
                                        ; functionality, so I am duplicating the check here.
     (else (and (member? (car s1) s2) (subset (cdr s1) s2))))))

(display "subset: '(one two three) '(one two three four): ")
(display-line (subset '(one two three) '(one two three four)))

(define eqset?
  (lambda (s1 s2)
    (and
     (subset s1 s2)
     (subset s2 s1))))

(display "eqset?: '(one two three) '(three two one): ")
(display-line (eqset? '(one two three) '(three two one)))
(display "eqset?: '(one three two) '(three one two four): ")
(display-line (eqset? '(one three two) '(three one two four)))

(define intersect?
  (lambda (s1 s2)
    (cond
     ((or (null? s1) (null? s2)) #f)
     ((member? (car s1) s2) #t)
     (else (intersect? (cdr s1) s2)))))

(display "intersect? '(one two three) '(three four five): ")
(display-line (intersect? '(one two three) '(three four five)))
(display "intersect? '(one two three) '(four five six): ")
(display-line (intersect? '(one two three) '(four five six)))

(define intersect
  (lambda (s1 s2)
    (cond
     ((or (null? s1) (null? s2)) '())
     ((member (car s1) s2)
      (cons
       (car s1)
       (intersect (cdr s1) s2)))
     (else (intersect (cdr s1) s2)))))

(display "intersect '(one two three) '(two three four): ")
(display-line (intersect '(one two three) '(two three four)))
(display "intersect '(one two three) '(four five six): ")
(display-line (intersect '(one two three) '(four five six)))
