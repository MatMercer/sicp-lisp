(defun fib (n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        ((+ (fib (- n 1)) (fib (- n 2))))
        )
  )

(print (fib 6))

(print (fib 30)) ; Very slow, tree recursive processes calls the procedure two times for each iteration, very bad n! complexity

(defun fastfib (n)
  (defun fib-iter (a b c)
    (if (= c 0)
      b
      (fib-iter (+ a b) a (- c 1))
      )
    )
  (fib-iter 1 0 n)
  )


(print (fastfib 2))
(print (fastfib 999)) ; Very fast, linear recursive procesure only needs to keep track of the last call one time
