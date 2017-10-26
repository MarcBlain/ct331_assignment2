#lang racket

; Question 2 Part 1
(define (ins_beg a b)         ; ((ins_beg 'a '(b c d)) should return '(a b c d)
  (cons a b))                 ; (ins_beg '(a b) '(b c d)) should return '((a b) b c d)

(ins_beg 'a '(b c d))
(ins_beg '(a b) '(b c d))

; Question 2 Part 2
(define (ins_end a b)         ; (ins_end '(a b) '(b c d)) should return '(b c d (a b))
  (append b (list a)))	      ; (ins_end 'a '(b c d))  should return '(b c d a)

(ins_end 'a '(b c d))
(ins_end '(a b) '(b c d))

; Question 2 Part 3
(define (cout_top_level tree)
  (if (or (not (list? tree)) (null? tree)) 0         
      (+ 1 (apply max (map cout_top_level tree))))) 
(cout_top_level '(1 2 3(4 5)))                        ; (cout_top_level '(1 2 3(4 5)))should return 2

; Question 2 Part 4 
(define (count_instances key lst)
   (if (null? lst)
       0
       (if (eq? key (car lst))
           (+ 1 (count_instances key (cdr lst)))
           (count_instances key (cdr lst)))))

   (count_instances 4 '(1 4 3 4 4))    ; (count_instances 4 '(1 4 3 4 4))  This should return 3

; Question 2 Part 5
(define (count_instances_tr key lst) 		
  (let counting ((lst lst) (n 0))
    (if (null? lst)
        n
        (counting (cdr lst)
                  (if (eq? key (car lst))
                      (+ n 1)
                      n)))))
(count_instances_tr 2 '(4 2 3 4 0 4 2)) ;(count_instances_tr 2 '(4 2 3 4 0 4 2)) should return 2

; Question 2 Part 6
(define (count_instances_deep lst)
  (cond ((null? lst) 0)
        ((list? lst) (+ (count_instances_deep (car lst)) (count_instances_deep (cdr lst))))
        (else 1)))

(count_instances_deep '(() 3 ()))		 ; (count_instances_deep '(() 3 ())) Should return 1