factorial(10, 3628800) :-
    !.
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
factorial(A, B) :-
    A>1,
    C is A+ -1,
    factorial(C, D),
    B is A*D,
    asserta((factorial(A, B):-!)).

