%Raiz, Izq, Der
prefija(mate(Raiz, HIzq, HDer)) :-  write('('), write(Raiz), prefija(HIzq), write(' '), prefija(HDer), write(')'), !.
prefija(H) :- write(' '), write(H), write(' ').

%Izq, Raiz, Der
infija(mate(HIzq, Raiz, HDer)) :- infija(HIzq), write(Raiz), infija(HDer), !.
infija(H) :- write(H).

%Izq, Der, Raiz
postfija(mate(HIzq, HDer, Raiz)) :- postfija(HIzq), postfija(HDer), write(Raiz), !.
postfija(H) :- write(H).

%Operaciones aritmeticas
mate('*',mate('+',mate('*','3','5'),mate('-','2','5')),'3').

%Arboles ternarios
%tree(Raiz, HIzq, HCen, HDer).
%Inorden: HIzq, Raiz, HCen, HDer
%Preorden: R, HIzq, HCen, HDer
%Postorden: HIzq, HCen, HDer, R