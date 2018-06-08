(defun square (x)
  "Returns the square of X"
  (* x x)
  )

(defun sqrmat (num)
  "SQRT of X"

  (defun good (guess)
    "Returns if the guess of the sqrt of a given number is good"
    (< (abs (- num (square guess))) 0.000001)
    )

  (defun sqrt-iter (g)
    (if (good g)
      g
      (sqrt-iter (/ (+ (/ num g) g) 2))
      )
    )
  (sqrt-iter 1.0)
  )

(print (sqrmat 0.0003))

