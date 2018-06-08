(defun square (x)
  "Returns the square of X"
  (* x x)
  )

(defun sqrmat (num)
  "SQRT of X"

  (defun good (oldguess guess)
    "Returns if the guess of the sqrt of a given number is good"
    (< (abs (- oldguess guess)) 0.000001)
    )

  (defun sqrt-iter (g)
    (let ((newg (/ (+ (/ num g) g) 2)))
      (if (good g newg)
        g
        (sqrt-iter newg)
        )
      )
    )

  (sqrt-iter 1.0)
  )

(print (sqrmat 0.0003))

