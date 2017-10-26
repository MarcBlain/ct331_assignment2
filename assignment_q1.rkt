#lang racket
(define conspair(cons 1 2))
(define conslist(cons 1 (cons 2 (cons 3 empty))))
;creat list needs cons empty
(define strNumNestedListWithCons(cons 'string (cons 4 (cons (cons 1 (cons 2 (cons 3 empty))) empty))))
;avoid using list notation
(define strNumNestedList (list 'string 4 (list 1 2 3)))
(define strNumNestedListWithAppend(append '(string) '(4) '((1 2 3))))
