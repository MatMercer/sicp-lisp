(defun square (x)
  "Returns the square of X"
  (* x x)
  )

(defun cuberoot (num)
  "Returns the cube root of num"

  (defun good (oldguess guess)
    "Returns if the guess of the root of a given number is good"
    (< (abs (- oldguess guess)) 0.000001)
    )

  (defun cuberoot-iter (g)
    (let ((newg (/ (+ (/ num (square g)) (* 2 g)) 3)))
      (if (good g newg)
        g
        (cuberoot-iter newg)
        )
      )
    )

  (cuberoot-iter 1.0)
  )

(print (cuberoot 31.006))

