%E2.2_Agentes
inicio :- consult('s11.3.pl').

agregar(A) :- assert(animal(A)).

buscar(A) :- animal(A), !.

eliminar(A) :- retract(animal(A)).

guardar :- tell('s11.3.pl'),
    listing(animal/1),
    told,
    write("Guardado...").

fin :- guardar, retractall(animal(_)).

respuesta(A):- animal(A), write("Es un animal").
respuesta(A):- \+animal(A), agregar(A), write("Nuevo conocimiento").
