%arbol(Raiz,HIzquierdo,HDerecho)

%arbol(raiz,hizq,hder).

%arbol(a,arbol(e,i,o),u).

%Prueba a,e,i,o,u
%arbol(a,arbol(e,i,o),u)

%Nombre Completo Inorden
arbol(arbol(arbol(arbol('S','e','r'),'g',arbol('i','o ','J')),'o',arbol(arbol('s','e ','A'),'g',arbol('u','a','s '))),'M',arbol(arbol('o','n','t'),'a',arbol('n','o',' '))).

%Apellido con mas caracteres Preorden.
arbol('M',arbol('o','n','t'),arbol('a','n','o')).

%Nombre y apellido Postorden
arbol(arbol(arbol('S','e','r'),arbol('g','i','o '),'A'),arbol('g','u','a'),'s').

%Raiz, Izq, Der
preorden(arbol(Raiz, HIzq, HDer)) :-  write(Raiz), preorden(HIzq), preorden(HDer), !.
preorden(H) :- write(H).

%Izq, Raiz, Der
inorden(arbol(HIzq, Raiz, HDer)) :- inorden(HIzq), write(Raiz), inorden(HDer), !.
inorden(H) :- write(H).

%Izq, Der, Raiz
postorden(arbol(HIzq, HDer, Raiz)) :- postorden(HIzq), postorden(HDer), write(Raiz), !.
postorden(H) :- write(H).

%Arbol Ternario - Raiz, HIzq, HCen, HDer
arbol('S',arbol('e','r','g','i'),arbol('o ','A','g','u'),arbol('a','s','','')).

%Raiz, Izq, Der
preordenTernario(arbol(Raiz, HIzq, HCen, HDer)) :-  write(Raiz), preordenTernario(HIzq), preordenTernario(HCen), preordenTernario(HDer), !.
preordenTernario(H) :- write(H).