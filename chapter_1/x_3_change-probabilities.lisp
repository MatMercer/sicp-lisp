(defvar half 50)
(defvar quarter 25)
(defvar dime 10)
(defvar nickel 5)
(defvar pennie 1)


(defun change (m)
  (defun getnote (n)
    (cond 
      ((= n 0) half)
      ((= n 1) quarter)
      ((= n 2) dime)
      ((= n 3) nickel)
      ((= n 4) pennie)
      )
    )

  (defun change-iter (note cur cnt)
    (if (= cur 0)
      cnt
      (if
        (>= cur (getnote note))
        (change-iter note (- cur (getnote note)) (+ cnt 1))
        (change-iter (+ note 1) cur cnt)
        )
      )
    )
  (change-iter 0 (* m 100) 1)
  )

; My failed try:
; (defun change2 (m)
;   (defun getnote (n)
;     (cond 
;       ((= n 4) half)
;       ((= n 3) quarter)
;       ((= n 2) dime)
;       ((= n 1) nickel)
;       ((= n 0) pennie)
;       )
;     )
; 
;   (defun change-iter (note cur cnt)
;     (if (>= cur m)
;       (if (= note 0)
;         cnt
;         (change-iter (- note 1) 0 cnt)
;         )
;       (change-iter note (+ cur (getnote note)) (+ cnt 1))
;       )
;     )
;   (change-iter 4 0 0)
;   )

(defun change2 (m)
  (defun getcoin (n)
    (cond 
      ((= n 5) half)
      ((= n 4) quarter)
      ((= n 3) dime)
      ((= n 2) nickel)
      ((= n 1) pennie)
      )
    )

  (defun cc (am kind)
    (cond
      ((= am 0) 1)
      ((or (< am 0)
           (= kind 0))
       0)
      ((+ (cc am (- kind 1)) (cc (- am (getcoin kind)) kind)))
      )
    )

  (defun lc (im am kind c allc)
    (cond
      ((= kind 0) allc)
      ((< am 0) 
       (lc im im (- kind 1) 0 allc)
       )
      ((lc im (- am (getcoin kind)) kind (+ c 1) (+ allc c)))
      )
    )

  (cc m 5)
  ;(lc m m 5 0 0) I've failed again!
  )

(print (change2 200))
