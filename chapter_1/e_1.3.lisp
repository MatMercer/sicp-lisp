(defvar x 3)
(defvar y 1)
(defvar z 2)

(defun larger (a b)
  "Returns the largest number"
  (if 
    (> a b)
    a
    b
  )
)

(defun square (a)
  "Returns the square of a number"
  (* a a)
)
    
(print 
  (+
    (square
      (larger x y)
    )
    (square
      (if (> x y) 
        (larger z y)
        (larger z x)
      )
    )
  )
)

