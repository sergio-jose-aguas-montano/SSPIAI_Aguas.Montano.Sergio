;Sergio Jose Aguas Montanio - 217815601
;Alfonso Manuel Vidrio Lizaola - 217150359

; Define tres listas originales sobre las que realizaran las operaciones
(setf tree1 '(1 . ((2 . nil) . (3 . nil))))
(setf ar2 '(1 ((2 nil)(3 nil))))

; car, cdr, c..r
; first, second, ..., rest

(setf arbol1 '(1 ((2((4 nil)(5 nil)))(3 ((6 nil)(7 nil))))))
(setf arbol2 '(1 . ((2 . ((4 . nil) . (5 . nil))) . (3 . ((6 . nil) . (7 . nil))))))

;Utiliza algunos ejemplos para extraer datos con las funciones
; 5 cddr (cadr arbol2)
; 6 first (cddr (rest arbol2))

; Puntitos -> car, cdr, c..r
; Sin puntitos -> first, second, ..., rest

(setq lista-prueba '(1 9 2 8 3 7 4 6 5 0))

;A partir de las necesidades del usuario, crea una lista defina por un tamanio fijo despues adjunta los elementos atomicos a la lista; o si lo prefieres solicita datos hasta que el usuario decida.
(defun crear-lista ()
  (loop ;inicio de ciclo
    :with lista = nil ;inicializa la lista
    :do (progn
          (format t "Ingrese un dato (o escriba \"fin\" para salir): ")
          (let ((dato (read-line))) ;inicializa la variable dato con el valor ingresado por el usuario
            (if (string= dato "fin") ;Si se escribe "fin" termina el ciclo
                (return-from crear-lista lista)
                (setq lista (append lista (list (convertir-a-numero dato))))))) ;En caso de haber numeros los convierte como enteros
    :finally (format t "Lista creada: ~a~%" lista))) ;Imprime la lista creada

;Funcion para convertir a numero los datos ingresados 
(defun convertir-a-numero (dato)
  "Convierte el dato a numero si es un numero, de lo contrario, devuelve el dato original."
  (if (string= (string-trim '(#\Space) dato) "")
      nil ; Si el dato esta en blanco, devuelve nil
      (handler-case (parse-integer dato)
        (error (condition) ;Atrapa el error 
          dato))))

;Ejemplo de uso: sort crear-lista #'>

;Desarrolla tres funciones diferentes que permitan la simplificacion o procesamiento individual de los elementos en una lista mediante mapcar, reduce, remove-if, count-if o sort
; Duplica los elementos de la lista en caso de ser numeros
(defun duplicar-elementos (lista)
  "Duplica cada elemento de la lista utilizando mapcar."
  (mapcar #'(lambda (x) (* 2 x)) lista))

;Suma los elementos de la lista y da un valor total
(defun suma-elementos (lista)
  "Calcula la suma de los elementos de la lista utilizando reduce."
  (reduce #'+ lista))

;Elimina los numeros pares de la lista
(defun eliminar-pares (lista)
  "Elimina los numeros pares de la lista utilizando remove-if."
  (remove-if #'evenp lista))

;Ejemplo de uso varias cosas: sort (duplicar-elementos (crear-lista)) #'>

;Mediante el lenguaje Common Lisp construyan un Arbol con el primer apellido de cada uno para recorrerlo en inorden, tal como el ejercicio realizado en lenguaje prolog; es necesario que la estructura sea acorde a la imagen y mediante la función "setf" o "setq".
;Ejemplo con el nombre del Profe
(setf nombre '(a((e((f nil)(n((r nil)nil))))(d((n nil)(o nil))))))   

;Primer apellido de Alfonso, Sergio y apellidos juntos
; Alfonso
(setf arbol-vidrio '(r ((i ((v nil) (d nil))) (o ((i nil))))))

; Sergio
(setf arbol-aguas '(u ((g ((a nil))) (s ((a nil))))))
;(setf apellido '(a((g((a nil)(u nil)))(s nil))))

;Mediante un comentario colocar en el archivo la consulta para recuperar la letra inicial y la final de la frase con la que se genero el arbol
; Recorrido apellidos aguasvidrio
(setf arbol-apellidos '(v((a((g((a nil)(u nil)))(s nil)))(i ((d((i nil)(r nil)))(o nil))))))

(first (first (second arbol-apellidos)))

(first (first (rest (second (second (second arbol-apellidos))))))

;busqueda arbol-vidrio 'i
;busqueda arbol-aguas 'u

; Busqueda-preorden - R, I, D
(defun busqueda (a x) 
  (if (endp a)
    NIL
  (if (equal (first a) x)
    (first a)
    (if (busqueda (first (second a)) x)
      (busqueda (first (second a)) x)
      (busqueda(second(second a)) x)
    )
  )
  )
)

; Realiza las funciones necesarias para llevar a cabo los recorridos en un Arbol: Preorden, Postorden e Inorden
;  Inorden - I, R, D
(defun inorden (a) 
  (if (endp a)
      NIL
    (append (inorden (first (second a)))
            (cons (first a)
            (inorden (second(second a)))))))

; Preorden - R, I, D
(defun preorden (a)
  (if (endp a)
      NIL
      (append (list (first a))
              (preorden (first (second a)))
              (preorden (second (second a))))))

; Postorden - I, D, R
(defun postorden (a)
  (if (endp a)
      NIL
      (append (postorden (first (second a)))
              (postorden (second (second a)))
              (list (first a)))))

; CAPI
(defun node-children (node)
  (when (< node 25)
    (list (* node 2)
          (1+ (* node 2))
          )
    )
)

;(setq tree (capi: contain
;                  (make-instance
;                   'capi:graph-pane
;                   ;Construccion
;                   :roots '(3)
;                   :children-function 'node-children
;                   :edge-pinboard-class 'capi:right-angle-line-pinboard-object
;                   :node-pinboard-class 'capi:push-button
;                   :layout-function
;                   :top-down
;                   :y-adjust :top
;                   :x-adjust :left
;                   )
;                  ;Tamanio ventana
;                  :best-width 500
;                  :best-height 500
;                  )
;)
;(setf (capi:graph-pane-roots tree) '(1))
