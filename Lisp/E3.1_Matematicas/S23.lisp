;Sergio Jose Aguas Montano - 217815601

;Common LISP 
; List Proessing

;Trabajo visto en clase
(write-line "Hola mundo de nuevo")

(defun cuadrado (x) (* x x))

(defun patito ()
  (setq variable (read))
  (print variable)
)

(defun compa (x y)
  (if (> x y)
      (format t "~d es mayor" x)
   (format t "~d es mayor" y)
      )
  )

(defun algo (x)
 (case x
   (1 (princ "Enero"))
   (2 (princ "Febrero"))
   )
)

(defun ciclo (ini fin aum)
  (loop
     (write "hola, buenas noshes")
     (setq ini (+ ini aum))
     (terpri)
     (when (>= ini fin)
       (return ini))
       )
)

(defun ciclo2 (in fin aum)
  (dotimes (in fin)
     (write in)
     (setq in (+ in aum))
     (terpri)
     )
)

(setf (symbol-function 'cuad)
      (lambda (x) (* x x))
)

(defun factorial (n)
  (if (> n 1)
      (* n (factorial(- n 1)))
      1)
)

;Teorema de pitágoras para calcular la hipotenusa
(defun hipotenusa(a b)
  (sqrt (+ (* a a) (* b b))))

;Calcula los 2 posibles valores de X para la fórmula general de las ecuaciones cuadráticas
(defun cuadraticas(a b c)
  (let* ((discriminante (- (* b b) (* 4 a c)))
         (sqrt-discriminante (sqrt discriminante)))
    (if (< discriminante 0)
        nil  ; No hay soluciones reales
        (list (/ (+ (- b) sqrt-discriminante) (* 2 a))
              (/ (- (- b) sqrt-discriminante) (* 2 a))))))

;Construye una función recursiva para la sucesión de Fibonacci
(defun fibonacci(n)
  (if (<= n 0)
      0
      (if (= n 1)
          1
          (+ (fibonacci (- n 1)) (fibonacci (- n 2))))))
