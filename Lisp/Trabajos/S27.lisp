;No ponderado
(setf australia '((ao . (tn as))
                  (as . (ao tn q ngs v))
                  (ngs . (as q v))
                  (q . (as ngs tn))
                  (tn . (as ao q))
                  (v . (as ngs))
                  (t . ()))
)

;Ponderado
(SETF VIEJOCONOCIDO '((I A . 3)
                      (A 4 . 4)
                      (A D . 5)
                      (I D . 4))
)

(SETF VIEJOCONOCIDO2 '((I  ((A 3)(D 4)))
                       (A  ((I 3)(B 4)(D 5)))
                       (B  ((A 4)(C 4)(E 5)))
                       (C  ((B 4)))
                       (D  ((A 5)(E 2)(I 4)))
                       (E  ((B 5)(D 2)(F 4)))
                       (F  ((E 4)(M 3)))
                       (M  ((F 3)))
                       )
)

;ASSOC, EQ

(DEFUN ADYACENTES (NODO GRAPH)
  (CADR (ASSOC NODO GRAPH))
)

(defun adyacentesR (nodo graph)
  (if (endp graph)
      NIL
    (if (eq nodo (caar graph))
        (cdar graph)
      (adyacentes nodo (cdr graph))
      )
    )
)

(DEFUN LISTAVI (GRAPH)
  (SETF LISTA '())
  (LOOP FOR ELEMENT IN GRAPH
        DO(PUSH (CAR ELEMENT) LISTA))
  (SORT LISTA #'STRING<)
) 

(defun extraerVec (nodo graph)
  (setf sublista (cadr (assoc nodo graph)))
  (mapcar (lambda (lista)(car lista)) sublista)
)