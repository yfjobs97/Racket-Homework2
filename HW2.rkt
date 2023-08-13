#lang racket
;Prob 4: last element function
(define list4 '(23 45 76(34 35)))

  (define (last-element list4) 
     (if (null? (cdr list4)) ;check if the last element is null
         (car list4)         ;pick the only element left if 2nd element is null
         (last-element (cdr list4)) ;eliminate previous terms by recursively call 
      )
    )
;call function 4
(last-element list4)

;Prob5 deep-reversed function
(define list5a '((1 2) (3 4)))
(define list5b '())

(define (deep-reversed list5a)
  (deep-reversed_sub list5a list5b);input the working list and the empty list
  )
(define (deep-reversed_sub list5a list5b)
  (if (null? list5a)
     list5b    ;if working list is empty, return the empty list
     (if (list? (car list5a))
         (deep-reversed_sub (cdr list5a) (cons (deep-reversed_sub (car list5a) '()) list5b));if working list is a list, recursively call the first and the remainder part of the list to reverse the order
         (deep-reversed_sub (cdr list5a) (cons (car list5a) list5b))
      )
  )
)

;call function 5
(deep-reversed list5a)


;Prob6 sum-odd-squares function
(define list6 '(1 2 (3 (4 5) 6)))
(define sum 0)

(define (sum-odd-squares list6)
  (if (list? list6)
      (if (null? list6)
          (+ sum 0) ;initial value is zero
          (if (list? (car list6))
              (+ (sum-odd-squares (car list6)) (sum-odd-squares (cdr list6)) ) ;if first element of list6 is still a list, recursive call until atom is seen. Eventually add two sides together
              (if (eq? (modulo (car list6) 2) 0); if atom seen, check odd or even
                  (+ sum (sum-odd-squares (cdr list6) ) ); if even, add the current sum to the result produced by the rest of the list
                  (+ (* (car list6) (car list6)) (sum-odd-squares (cdr list6)) ); if odd, add the square of the current number to the result prduced by the rest of the list
               )
              
          )
       )
      sum ;if list6 is not a list
  )
)
;call function 6
(sum-odd-squares list6)

;Prob7 subsets function
(define (subsets list7)
  (if (null? list7); if the set is null, its subset null
      (cons '() '())
      (append (subsets (cdr list7)) (map (lambda (s) (cons (car list7) s)) (subsets (cdr list7)) ) )    ;first recursion gives all subsets of list7 without the first element.
                                                                                                        ;the map fucntion lets every instance of the second recursive function to force the first element of the original set as the first element of every subsets it will produce.                                                                                                      
  )
)

;call function 7
(subsets (list 1 2 3))


;Prob8 EXP-DEPTH function
(define list8 '(I J ((K) L) M ))
(define depth 0)

(define (EXP-DEPTH list8)
  (if (null? list8) ;if list8 is null list, then the depth is 0
      0 
      (if (list? list8); if list8 is a list (not an atom), then the deepest nested list is obtained by the recursively divide the list into small fragments and measure the depth. 
          (max (+ 1 (EXP-DEPTH (car list8))) (EXP-DEPTH (cdr list8)) );As car reduce a level of list, it is compensated when using max to find out the greatest depth.
          0  ;if it is just an atom, the depth is 0
      )
  )
)
;call function 8
(EXP-DEPTH list8)

;Prob9 enum-interval function
(define list9 '())
(define (enum-interval 9a 9b)
  (enum-interval_sub 9a (- 9b 1) list9);pass in list9

)
(define (enum-interval_sub 9a 9b list9)
  (if (> 9a 9b); if 9a is greter than 9b, then reach the end of range, return list9
      list9
      (if (eq? (modulo 9b 2) 0) ;if 9b is even
          (enum-interval_sub 9a (- 9b 1) (cons 9b list9)) ;put the value at the end of list, and put the recursive call the next value
          (enum-interval_sub 9a (- 9b 1) list9); if odd, no modification to the list
      )
  )
)
;call function 9
(enum-interval 1 10)

;Prob10 fib-squares function
(define fibo_list '())

(define (fib-squares num)
  (fib-seq 0 num fibo_list);calls the Fibonacci sequence function 
)

(define (fibo n);Fibonacci algorithm
  (cond
    ((= n 0) 0)
    ((= n 1) 1)
    (else (+ (fibo (- n 1)) (fibo (- n 2))))
    )
  )

(define (fib-seq start fin seq_list)
  (if (> start fin)
      seq_list ;if starting value is greater, sequence list generated successfully
      (fib-seq start (- fin 1) (cons (* (fibo fin) (fibo fin)) seq_list)) ;generate list by passing 0 as starting value, one less than previous call as ending value, and a list of current fibonacci value squared   
  )
)

;call function 10
(fib-squares 10)

          

