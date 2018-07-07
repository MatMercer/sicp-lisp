; The exercise states:
; f(n) = n if n < 3
; and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n >= 3
;
; I added a "4" f to understand better what was going on

(defun f (n)
  (if (< n 4)
    n
    (+ (f (- n 1)) (* (f (- n 2)) 2) (* (f (- n 3)) 3) (* (f (- n 4)) 4)
    ; when 3 (+ 2 2 0)                  = 4
    ; when 4 (+ (+ (+ 2 2 0) 4 3)       = 11
    ;
    ; when 5 (+ (f 4)) (* 2 (f 3)) (* 3 (f 2) ))
    )
  )
  )

(defun f5 (n)
  "Here I finally understood wtf was going on, we need to keep track of the states in a recursive call"
  (defun iter (a b c d i)
    (if (< i 4)
      a
      ; a = NEWVALUE, b = a, c = b, d = c
      (iter (+ a (* 2 b) (* 3 c) (* 4 d)) a b c (- i 1))
    )
    )

  ; Initial values, f(4 - 1), f(4 - 2), f(4 - 3), f(4 - 4)
  (iter 3 2 1 0 n)
  )

(print (f5 26))
(print (f 26)) ; Stack overflow for u baby <3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; HERE ARE THE FAILED ALGORITHMS OF DOOM ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
; My first failed try :D
; (defun f-iter (n)
;   (defun lthan3 (x m)
;     (if (>= (- x m) 3) 
;       (* (- x m) m)
;       (- x m)
;       )
;     )
; 
;   (defun f (n c)
;     (if (> n 0)
;       (f (- n 1)
;           (+ c 
;              (if (< n 3)
;                n
;                (+ (lthan3 n 1) (lthan3 n 2) (lthan3 n 3))
;                ; 2 + 2 + 0 + 2 + 1
;                )
;              )
;           )
;       c
;       )
;     )
; 
;   (f n 0)
;   )
;
;
;(defun ftest (n)
;  "So... Let's isolate the problem a bit to see how the function works, piece by piece"
;  (if (< n 3)
;    n
;    (+ (ftest (- n 1)))
;    ; f ( 4 - 1 )
;    )
;  )
;
;(defun f1 (n)
;  "Yay, everything looks good for now..."
;  (defun f-iter (i c)
;    (if (= i 1)
;      c
;      (f-iter (- i 1) (+ c (if (< i 3) i 0)))
;      )
;    )
;
;  (f-iter n 0)
;  )
;
;(defun ftest2 (n)
;  "So... Let's isolate the problem a bit to see how the function works, piece by piece"
;  (print n)
;  (if (< n 3)
;    n
;    (* (ftest2 (- n 2)) 2 )
;    ; (* 2 (ftest2 2))
;    ; (* 2 (* 2)
;    ; 4
;    ;
;    ; (* 2 (ftest2 3))
;    ; (* 2 (* 2))
;    ; 4
;    )
;  )
;
;(defun f2 (n)
;  "Yay, everything looks good for now..."
;
;  (defun f-iter (i s)
;    (print i)
;    (print s)
;    (if (<= i 3)
;      (* s 2)
;      (f-iter
;        (- i 2)
;        (* s 2)
;        )
;      )
;    )
;
;  (f-iter n 1)
;  )
;
;(defun f3 (n)
;  (defun n-calc (c a)
;    (- n (* c a))
;    )
;
;  (defun finished (c a)
;    (cond ((< (n-calc c a) 3)))
;    )
;
;  (defun getlast (a)
;    (if (<= (mod n a) 0)
;      (+ (mod n a) a)
;      (mod n a)
;      )
;    )
;
;  (defun f-iter (c s2 s3)
;    (if (and (finished c 1) (finished c 2) (finished c 3))
;      (+ (getlast 1) (* (getlast 2) s2) (* (getlast 3) s3))
;      (f-iter (+ c 1) (if (finished c 2) s2 (* s2 2)) (if (finished c 3) s3 (* s3 3)))
;      )
;    )
;
;  (f-iter 0 2 3)
;  )
;
;
;(defun f4 (n)
;  (defun f-iter (a b c i)
;    (print '---)
;    (print a)
;    (print b)
;    (print c)
;    (print '---)
;    (if (< i 3)
;      a
;      (f-iter 
;        (+ a (* (- i 2) b 2) (* (- i 3) c 3))
;        (+ a (* (- i 2) b 2))
;        a
;        (- i 1)
;        )
;      )
;    )
;
;  (f-iter 1 2 3 n)
;  )
;
;
