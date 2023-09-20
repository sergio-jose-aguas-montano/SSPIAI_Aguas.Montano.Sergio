%Consultar el archivo S11
inicio :- consult('s11.3.pl').

agregar(A) :- assert(animal(A)).
buscar(A) :- respuesta(A).
eliminar(A) :- retract(animal(A)).
%Guardar con tell, listing, told
guardar :- tell('S11.3.pl'),
        listing(mamifero/1),told,
        write("Guardado ...").

fin :- retractall(animal(_)).

respuesta(A) :- mamifero(A), write('es un animal').
respuesta(A) :- \+animal(A), agregar(A), write("Nuevo Conocimiento").
