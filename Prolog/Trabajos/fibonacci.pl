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

