;;;; Chapter 6 examples
;;; Note: run this file with 'mit-scheme --quiet < c6.scm'

;;; Helpers
;; Print something and a newline
(define display-line
  (lambda (input)
    (display input)
    (newline)))

(define atom?
  (lambda (x)
    (and (not (pair? x))(not (null? x)))))

;; The goal is to identify cases where the first position is a number, the
;; second position is one of x, +, ^, -, or / and the third position is a
;; number. The more complete draft of the book assumes that you only use the
;; right operators and moves on with life.
(define numbered?
  (lambda (aexp)
    (cond
     ((atom? aexp) (number?  aexp))
     (else
      (and
       (numbered? (car aexp))
       (numbered? (car (cdr (cdr aexp)))))))))

(display "(numbered? '(1 + 2)): ")
(display-line (numbered? '(1 + 2)))

(display "(numbered? '(1 2 3)): ")
(display-line (numbered? '(1 2 3)))

(display "(numbered? '(a b c)): ")
(display-line (numbered? '(a b c)))
(newline)


;;;; The next 3 methods are all list manipulation for lists that contain mathematical expressions
;; 1st-sub-expression gives back whatever is in the 1st position
;; ex: (1st-sub-expression '(1 + 2)) => 1, (1st-sub-expression '(+ 1 2)) => +
(define 1st-sub-exp
  (lambda (aexp)
    (car  aexp)))
;; middle-sub-exp gives back whatever is in the 2nd position
;; ex: (middle-sub-exp '(1 + 2)) => +, (middle-sub-exp '(+ 1 2)) => 1
(define middle-sub-exp
  (lambda (aexp)
    (car (cdr aexp))))

;; 2nd-sub-exp gives back whatever is in the 3rd position
;; ex: (2nd-sub-exp '(1 + 2)) => 2, (2nd-sub-exp '(+ 1 2)) => 2
(define 2nd-sub-exp
  (lambda (aexp)
    (car (cdr (cdr aexp)))))

;;;; value-implementation-agnostic is a method that attempts to evaluate the given mathematical expression, regardless of its format.
;; nexp => the expression to be evaluated (ex: '(1 + 2), '(1 + (2 + 3)))
;; 1st-operand-exp => a lambda that gives back the 1st operand in the expression (ex: (1st-operand-exp '(1 + 2)) => 1, (1st-operand-exp '(+ 1 2)) => 1)
;; 2nd-operand-exp => a lambda that gives back the 2nd operand in the expression (ex: (2nd-operand-exp '(1 + 2)) => 2, (2nd-operand-exp '(+ 1 2)) => 1)
;; operator => a lambda that gives back the operator in the expression (ex: (operator '(1 + 2)) => +, (operator '(+ 1 2)) => +)
(define value-implementation-agnostic
  (lambda (nexp 1st-operand-exp 2nd-operand-exp operator)
    (cond
     ((atom? nexp)
      nexp)
     ((eq? (operator nexp) '+)
      (+ (value-implementation-agnostic (1st-operand-exp nexp) 1st-operand-exp 2nd-operand-exp operator)
         (value-implementation-agnostic (2nd-operand-exp nexp) 1st-operand-exp 2nd-operand-exp operator)))
     ((eq? (operator nexp) 'x)
      (* (value-implementation-agnostic (1st-operand-exp nexp) 1st-operand-exp 2nd-operand-exp operator)
         (value-implementation-agnostic (2nd-operand-exp nexp) 1st-operand-exp 2nd-operand-exp operator)))
     (else
      (expt (value-implementation-agnostic (1st-operand-exp nexp) 1st-operand-exp 2nd-operand-exp operator)
            (value-implementation-agnostic (2nd-operand-exp nexp) 1st-operand-exp 2nd-operand-exp operator))))))

;;;; The following functions use the previous agnostic approach to make convenient shortcut methods that are specific for different value notations
(define value-prefix-notation
  (lambda (nexp)
    (value-implementation-agnostic nexp middle-sub-exp 2nd-sub-exp 1st-sub-exp)))

(define value-postfix-notation
  (lambda (nexp)
    (value-implementation-agnostic nexp 1st-sub-exp middle-sub-exp 2nd-sub-exp)))

(define value-infix-notation
  (lambda (nexp)
    (value-implementation-agnostic nexp 1st-sub-exp 2nd-sub-exp middle-sub-exp)))

(display-line "Testing")
(display-line (value-prefix-notation '(+ 1 (+ 2 3))))
(display-line (value-postfix-notation '(1 (2 3 +) +)))
(display-line (value-infix-notation '(1 + (2 + 3))))
