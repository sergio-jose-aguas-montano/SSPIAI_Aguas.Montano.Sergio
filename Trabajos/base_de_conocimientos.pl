:- dynamic factorial/2.

factorial(9, 362880) :-
    !.
factorial(8, 40320) :-
    !.
factorial(7, 5040) :-
    !.
factorial(6, 720) :-
    !.
factorial(5, 120) :-
    !.
factorial(4, 24) :-
    !.
factorial(3, 6) :-
    !.
factorial(2, 2) :-
    !.
factorial(1, 1) :-
    !.
factorial(X, Y) :-
    X>1,
    X1 is X+ -1,
    factorial(X1, Y1),
    Y is X*Y1,
    asserta((factorial(X, Y):-!)).

:- dynamic fibonacci/2.

fibonacci(12, 144) :-
    !.
fibonacci(11, 89) :-
    !.
fibonacci(10, 55) :-
    !.
fibonacci(9, 34) :-
    !.
fibonacci(8, 21) :-
    !.
fibonacci(7, 13) :-
    !.
fibonacci(6, 8) :-
    !.
fibonacci(5, 5) :-
    !.
fibonacci(4, 3) :-
    !.
fibonacci(3, 2) :-
    !.
fibonacci(2, 1) :-
    !.
fibonacci(0, 0) :-
    !.
fibonacci(1, 1) :-
    !.
fibonacci(A, B) :-
    A>1,
    C is A+ -1,
    D is A+ -2,
    fibonacci(C, E),
    fibonacci(D, F),
    B is E+F,
    asserta((fibonacci(A, B):-!)).

