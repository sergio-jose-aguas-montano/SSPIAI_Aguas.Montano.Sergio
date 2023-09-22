% Autor: [Sergio José Aguas Montaño - 217815601]

% Cargar la base de conocimientos
inicio :- consult('base_de_conocimientos.pl').

% Cálculo del factorial de un número
factorial(1, 1) :- !.
factorial(X, Y) :-
    X > 1,
    X1 is X - 1,
    factorial(X1, Y1),
    Y is X * Y1,
    asserta(factorial(X, Y) :- !).

%factorial(_,_) :- write("No existe el factorial de ese numero!\n").

% Cálculo de la serie de Fibonacci
fibonacci(0, 0) :- !.
fibonacci(1, 1) :- !.
fibonacci(N, X) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, X1),
    fibonacci(N2, X2),
    X is X1 + X2,
    asserta(fibonacci(N, X) :- !).

% Consulta y guarda el conocimiento en caso necesario
consultar(C) :- C, guardar.

% Guardar la base de conocimientos en un archivo
guardar :-
    tell('base_de_conocimientos.pl'),
    listing(factorial/2),
    listing(fibonacci/2),
    told.

fin :-  
    retractall(factorial(_,_)),
    tell('base_de_conocimientos.pl'),
    listing(factorial/2),
    listing(fibonacci/2),
    told.
