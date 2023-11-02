; Función 'duplicar' que toma un número y devuelve el doble
(defun duplicar (x) (* 2 x))

; Función 'es-par' que verifica si un número es par
(defun es-par (x) (= (mod x 2) 0))

; Función 'suma' que toma dos números y devuelve su suma
(defun suma (x y) (+ x y))

; Lista de números
(setq numeros '(1 2 3 4 5 6 7 8 9 10))

; Aplicar 'duplicar' a cada elemento de la lista usando 'map'
(setq duplicados (mapcar #'duplicar numeros))

; Filtrar los elementos pares de la lista usando 'filter'
(setq pares (remove-if-not #'es-par numeros))

; Sumar todos los elementos de la lista usando 'reduce'
(setq suma-total (reduce #'suma numeros))

(format t "Lista original: ~a~%" numeros)
(format t "Duplicados: ~a~%" duplicados)
(format t "Números pares: ~a~%" pares)
(format t "Suma total: ~a~%" suma-total)
