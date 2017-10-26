#lang racket

(define example_tree '(((() 7 ()) 12 (() 19 ())) 27 ((() 35 ()) 48 (() 52 ()))))
(define example_to_sort '(7 12 19 65 4 92 36 74 83))

(define (display_sorted tree)
  (begin (cond [(not (empty? (left_child tree))) (display_sorted (left_child tree))])
         (printf "~a~n" (value tree)) 
         (cond [(not (empty? (right_child tree))) (display_sorted (right_child tree))])))

(define (present_in_tree item tree)
  (cond [(empty? tree) #f]
        [(equal? item (value tree)) #t]
        [(< item (value tree)) (present_in_tree item (left_child tree))]
        [else (present_in_tree item (right_child tree))])) ; (> item tree>value

(define (insert item tree)
  (higher_order_insert item tree <))

; splitting higher order funtction
; higher order tree sort
(define (higher_order_insert item tree is_on_left)
  (cond [(empty? tree) (list '() item '())]
        [(equal? item (value tree)) tree]
        [(is_on_left item (value tree))
         (list (higher_order_insert item (left_child tree) is_on_left) (value tree) (right_child tree))]
        [else ; same as "(is_on_right item (value tree)"
         (list (left_child tree) (value tree) (higher_order_insert item (right_child tree) is_on_left))]))

(define (insert_list lst tree)
  (if (empty? lst) tree
      (insert_list (cdr lst) (insert (car lst) tree))))

(define (higher_order_insert_list lst tree is_on_left)
  (if (empty? lst) tree
      (higher_order_insert_list (cdr lst) (higher_order_insert (car lst) tree is_on_left) is_on_left)))

(define (tree_sort lst)
  (display_sorted (insert_list lst '())))

(define (higher_order_tree_sort lst order_function)
  (display_sorted (higher_order_insert_list lst '() order_function)))

(define (value tree)
  (cadr tree))

(define (left_child tree)
  (car tree))

(define (right_child tree)
  (caddr tree)) 

(define (ascending_last_digit x y)
  (< (remainder x 10) (remainder y 10)))

(display "display_sorted:\n")
(display_sorted example_tree)

(display "present_in_tree:\n")
(present_in_tree 40 example_tree)
(present_in_tree 109 example_tree)

(display "insert:\n")
(insert 8 example_tree)

(display "insert_list:\n")
(insert_list '(2 8 34 100) example_tree)

(display "tree_sort:\n")
(tree_sort example_to_sort)

(display "higher_order_tree_sort:\n")
(display "Ascending Lowest to Highest:\n")
(higher_order_tree_sort example_to_sort <)
(display "Descending Highest to Lowest:\n")
(higher_order_tree_sort example_to_sort >)
(display "Ascend based on the last digit:\n")
(higher_order_tree_sort example_to_sort ascending_last_digit)
