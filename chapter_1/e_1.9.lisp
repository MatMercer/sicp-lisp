(defun inc (x)
  (+ x 1)
  )

(defun dec (x)
  (- x 1)
  )

(defun sum1 (a b)
  (if (= a 0)
    b
    (inc (sum1 (dec a) b))
    )
  )

; (if (= 4 0)
;   5
;   (+ 
;     (if (= 3 0) 
;       5
;       (+ (if (= 2 0) 
;            5
;            (+
;              (if (= 1 0)
;                5
;                (+
;                  (if (= 0 0)
;                    5
;                    )
;                  1)
;                )
;              1)
;            )
;          1)
;       )
;     1)
;   )
; )
; 9 :)
;
; This process is recursive and the procedure is recursive

(defun sum2 (a b)
  (if (= a 0)
    b
    (sum2 (dec a) (inc b))
    )
  )

; (if (= 4 0)
;   5
;   (if (= 3 0)
;     6
;     (if (= 2 0)
;       7
;       (if (= 1 0)
;         8
;         (if (= 0 0)
;           9
;           )
;         )
;       )
;     )
;   )
; 9 :)
; This process is iterative and the procedure is recursive

; (print (sum1 9999999 1)) ; Stack overflow :D "The computer needs to know about the last states, usually they use a data structure called stack"
(print (sum2 9999999 1))

