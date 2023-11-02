% Autor: [Sergio José Aguas Montaño - 217815601]

% Cargar los archivos donde se guardan
inicio :- consult('factorial.pl').
inicio :- consult('fibonacci.pl').

% Cálculo del factorial de un número
factorial(1, 1) :- !.
factorial(X, Y) :-
    X > 1,
    X1 is X - 1,
    factorial(X1, Y1),
    Y is X * Y1,
    asserta(factorial(X, Y) :- !).

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

% Guardar la base de conocimientos en diferentes archivos
guardar_fib :-
    tell('fibonacci.pl'),
    listing(fibonacci/2),
    told.

guardar_fac :-
        tell('factorial.pl'),
        listing(factorial/2),
        told.

%Guardado para ambos archivos.
guardar :- 
    guardar_fac,
    guardar_fib.

fin :-  
    retractall(factorial(_,_)),
    tell('fibonacci.pl'),
    listing(fibonacci/2),
    told,
    tell('factorial.pl'),
    listing(factorial/2),
    told.
