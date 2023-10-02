%arbol(Raiz,HIzquierdo,HDerecho)

%arbol(raiz,hizq,hder).

arbol(a,arbol(e,i,o),u).

%Raiz, Izq, Der
preorden(arbol(Raiz, HIzq, HDer)) :-  write(Raiz), preorden(HIzq), preorden(HDer), !.
preorden(H) :- write(H).

%Izq, Raiz, Der
inorden(arbol(Raiz, Hizq, HDer)) :- inorden(Hizq), write(Raiz), inorden(HDer).
inorden(H) :- write(H).

%Izq, Der, Raiz
postorden(arbol(Raiz, HIzq, HDer)) :- postorden(HIzq), postorden(HDer), write(Raiz), !.
postorden(H) :- write(H).

