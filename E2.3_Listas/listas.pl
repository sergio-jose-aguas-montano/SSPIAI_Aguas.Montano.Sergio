%LISTAS

%Simple
mamiferos([leon,perro,tigre,caballo]).
semana([lunes,martes,sabado]).

%Listas de listas
animales(
    [leon,tigre,jaguar],
    [caballo],
    [perro,oso],
    [oso_hormiguero]
    ).
%Aridad 'N'

%Listas como relación
animales(carnivoro,[lobo,leopardo,leon]).
animales(insectivoro,[rana,camaleon]).

%Listas y elementos
platillos([pozole,pozolillo],tamales,[chile_relleno,chile_nogada],barbacoa).

%Vectores
vector([1,2,3],[x,y,z]).


% OPERACIONES
% Comprobar
lista([]).
lista([_|T]) :- lista(T).

% Buscar
% buscar(leon,[perro,leon,gato]).
buscar(E, [E|_]) :- !.
buscar(E, [_|L]) :- buscar(E,L).

% Agregar
% agregar(perro, [leon,gato], NuevaLista).
agregar(E,[],[E]) :- !.
agregar(E,[H|T],[H|L]) :- agregar(E,T,L).

insertar(E,L,Lr) :- Lr - [E|L].
insertar2(E,L,[E|L]).
insertar3(E,L,[Rh|Rt]) :- Rh - E, Rt -L.

% Longitud
% longitud([perro,gato,raton],L).
longitud([],0).
longitud([_|T], L) :- longitud(T, Lc), L is Lc + 1.

% Concatenar
% concatenar([leon, gato],[perro,raton],D).
concatenar([],L,L).
concatenar([H|T],L,[H|Result]) :- concatenar(T,L,Result).

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


