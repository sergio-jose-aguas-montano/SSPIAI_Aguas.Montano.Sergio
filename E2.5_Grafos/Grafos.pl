%Grafos

%Grafo 1
g1(a,b).
g1(a,d).
g1(a,i).
g1(b,c).
g1(b,a).
g1(b,e).
g1(c,b).
g1(d,a).
g1(d,e).
g1(d,i).
g1(e,d).
g1(e,b).
g1(e,f).
g1(f,e).
g1(i,a).
g1(i,d).
g1(m,m).

%Grafo 2
g2(5,11).
g2(7,11).
g2(7,8).
g2(8,9).
g2(11,2).
g2(11,10).
g2(11,9).
g2(2,5).

%Grafo 3
g3(a,d,5).
g3(a,i,3).
g3(a,b,4).
g3(d,a,5).
g3(d,i,4).
g3(d,e,2).
g3(e,d,2).
g3(i,a,3).
g3(i,d,4).

%Recorrido
imp_salto(N1,N2) :- write(N1), write(" -> "), write(N2), nl.
camino1(Origen,Destino) :- g1(Origen,Destino) ,imp_salto(Origen,Destino), !.
camino1(Origen,Destino) :- g1(Origen,NodosTemporales), imp_salto(Origen,NodosTemporales), camino1(NodosTemporales,Destino), !.

camino2(Origen,Destino) :- g2(Origen,Destino) ,imp_salto(Origen,Destino), !.
camino2(Origen,Destino) :- g2(Origen,NodosTemporales), imp_salto(Origen,NodosTemporales), camino2(NodosTemporales,Destino), !.

imp_salto3(N1,N2,P) :- write(N1), write(" -> "), write(N2), write(' ['), write(P), write(']'), nl.
%Primero intenta este
camino3(Origen,Destino,T) :- g3(Origen,Destino,T), imp_salto3(Origen,Destino,T), !.
%Sino, este
camino3(Origen,Destino,T) :- g3(Origen,NodosTemporales,P), imp_salto3(Origen,NodosTemporales,P), camino3(NodosTemporales,Destino,T1), T is P+T1, !.

%Grafos con listas
grafo(gnn, [a-i, a-b, a-d, b-c, b-e, d-e, d-i, e-f, f-m]).
vecino_nd(N1,N2,G) :- grafo(G,L), ((member(N1-N2,L);member(N2-N1,L)) -> write("Son vecinos"); write("No existe")).

%Grafo de Australia
grafo(australia, ["tn"-"q", "tn"-"as", "tn"-"ao", "q"-"ngs", "as"-"ngs", "ao"-"as", "as"-"ngs", "ngs"-"v"]).


%Tipo de IF en Prolog: (Condition -> then; else)

vecino_d(N1,N2,G) :- grafo(G,L), (member(N1>N2,L);member(N2>N1,L)).
grafo(gdn, [f>a, a>e, a>d, d>c, b>f, b>c]).

vecinos(N1,N2,G) :- grafo(G,L), (member(N1-N2,L);member(N2-N1,L)).

%Conocer todos los vertices/nodos de un grafo
vertices(G,Ln) :-   
    %bagof - devuelve una lista con los datos consultados
    %bagof(N1,N2^vecinos(N1,N2,G), Ln).

    %setof - devuelve una lista con los datos consultados aplicando sort
    setof(N1,N2^vecinos(N1,N2,G), Ln).

%listar_n(G) :- grafo(G,L), nodos(L, []).
%nodos([],Lr) :- sort(Lr,Lf), write(Lf).
%nodos([N1-N2|T], Lr) :- 
%    L1 = [N1|Lr],
%    L2 = [N2|L1],
%    nodos(T,L2).

imprimir_g(G) :- grafo(G,L), lista(L).
lista([]).
%Agregar el contador que aumente cuando imprima la lista
lista([H|T]) :- write("\n\t- Arista: "), write(H), lista(T).

recorrido(G,O,D,C) :- 
    recorrido_aux(G,O,[D],C).

recorrido_aux(_,O,[O|C1],[O|C1]).
recorrido_aux(G,Ax,[Dx|C1],C) :- 
    vecinos(Nt,Dx,G), 
    not(member(Nt,[Dx|C1])), 
    recorrido_aux(G,Ax,[Nt,Dx|C1],C).