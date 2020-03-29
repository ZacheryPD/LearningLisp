;;;; Chapter 7 notes
;; To run this file, install mit-scheme and run "scheme --quiet < c7.scm"

;; Helpers
; Print something and a newline
(define display-line
  (lambda (input)
    (display input)
    (newline)))

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
(display "set? (one two three)")
(display-line (set? '(one two three)))

(define makeset
  (lambda (lat)
    (cond
     ((null? lat) '())
     ((member? (car lat) (cdr lat)) (makeset (cdr lat)))
     (else (cons (car lat) (makeset (cdr lat)))))))

(display "makeset: one two one three one four: ")
(display-line (makeset '(one two one three one four)))

