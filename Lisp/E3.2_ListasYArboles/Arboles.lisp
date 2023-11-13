;Sergio Jose Aguas Montano - 217815601

;2 formas de crear arboles en Lisp 
;(Lisp y Common Lisp)

;Forma 1
(setq arbol1 '(a (e (i) (o)) (u)))

;Forma 2
(setq arbol2 '(a (e (i () ()) (o () ())) (u () ())))
