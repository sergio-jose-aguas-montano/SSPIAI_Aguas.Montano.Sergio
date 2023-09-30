%LISTAS
figuras([cuadrado]).
colores([verde]).
nombres([sergio]).
numeros([1]).
letras([a]).

% OPERACIONES
% Comprobar
lista([]).
lista([_|T]) :- lista(T).

% Definir la regla para buscar un elemento en una lista
buscar(E, [E|_]) :- !.
buscar(E, [_|L]) :- buscar(E, L).

% Agregar
% agregar(perro, [leon,gato], NuevaLista).
inserta([],X,[X]).
inserta([H|T], N, [H|R]) :- inserta(T, N, R).

nuevoElemento(Y):-lista(X), inserta(X, Y, Nueva), asserta(lista(Nueva)).

%insertar(E,L,Lr) :- Lr = [E|L].
%insertar2(E,L,[E|L]).
insertar(Elemento, Lista, Resultado) :- Resultado = [Elemento | Lista].

% Longitud
% longitud([perro,gato,raton],L).
longitud([],0).
longitud([_|T], L) :- longitud(T, Lc), L is Lc + 1.

% Concatenar
% concatenar([leon, gato],[perro,raton],D).
concatenar([],L,L).
concatenar([H|T],L,[H,Result]) :- concatenar(T,L,Result).

% Eliminar
eliminar([],_,_).
eliminar([H|T],B,N) :- H\=B, agregar(H,R,N), eliminar(T,B,R).
eliminar([H|T],B,N) :- \+(H\=B), eliminar(T,B,N).

remover(_,[],[]).
remover(R, [R|T], T2) :- remover(R, T, T2).
remover(R, [H|T], [H|T2]) :- H \= R, remover(R, T, T2).

removerPrimero(_,[],[]).
removerPrimero(R, [R|T], T) :- !.
removerPrimero(R, [H|T], [H|T2]) :- H \= R, removerPrimero(R, T, T2).

% is_list (comprobar) >> is_list([1,2,3]).
% length (longitud) >> length([1,2,3],Lr).
% member (buscar) >> member(
% append (agregar y concatenar) >> append([1,2,3],[4,5,6],Lr).
% delete (eliminar) >> delete([1,2,3],2,Lr).
% sort (ordenar) >> sort([2,3,1],Lr).
% msort >> msort([2,3,1],Lr).

contar_elem(Tipo,Cant) :- animales(Tipo,Lista), longitud(Lista,Cant).


