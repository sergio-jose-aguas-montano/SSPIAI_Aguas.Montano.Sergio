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

%Grafos con listas

grafo(gnn, [a-i, a-b, a-d, b-c, b-e, d-e, d-i, e-f, f-m]).
vecino_nd(N1,N2,G) :- grafo(G,L), ((member(N1-N2,L);member(N2-N1,L)) -> write("Son vecinos"); write("No existe")).

%Grafo de Australia
grafo(australia, ['tn'-'q', 'tn'-'as', 'tn'-'ao', 'q'-'ngs', 'as'-'ngs', 'ao'-'as', 'as'-'ngs', 'ngs'-'v']).

%Tipo de IF en Prolog: (Condition -> then; else)
grafo(gdn, [f>a, a>e, a>d, d>c, b>f, b>c]).

listar_n(G) :- grafo(G,L), nodos(L, []).
nodos([],Lr) :- sort(Lr,Lf), write(Lf).
nodos([N1-N2|T], Lr) :- 
    L1 = [N1|Lr],
    L2 = [N2|L1],
    nodos(T,L2).

% ***** Listado de puntos de la tarea *****

%Realiza un recorrido recursivo entre nodos por medio de una lista es posible que se cicle.
recorrido(G,O,D,C) :- 
    recorrido_aux(G,O,[D],C).
recorrido_aux(_,O,[O|C1],[O|C1]).
recorrido_aux(G,Ax,[Dx|C1],C) :- 
    vecinos(Nt,Dx,G), 
    not(member(Nt,[Dx|C1])), 
    recorrido_aux(G,Ax,[Nt,Dx|C1],C).
imprimir_g(G) :- grafo(G,L), lista(L).
lista([]).
lista([H|T]) :- write("\n\t- Arista: "), write(H), lista(T).

%Imprime en pantalla los saltos que realiza entre nodos
imp_salto3(N1,N2,P) :- write(N1), write(" -> "), write(N2), write(' ['), write(P), write(']'), nl.
camino3(Origen,Destino,T) :- g3(Origen,Destino,T), imp_salto3(Origen,Destino,T), !.
camino3(Origen,Destino,T) :- g3(Origen,NodosTemporales,P), imp_salto3(Origen,NodosTemporales,P), camino3(NodosTemporales,Destino,T1), T is P+T1, !.

%Identificar si dos nodos son adyacentes o vecinos
vecino_d(N1,N2,G) :- grafo(G,L), (member(N1>N2,L);member(N2>N1,L)).
vecinos(N1,N2,G) :- grafo(G,L), (member(N1-N2,L);member(N2-N1,L)).

%Obtener todos los nodos adyacentes o vecinos desde otro nodo dado
nodos_adyacentes(Origen, Grafo, Adyacentes) :-
    findall(Destino, vecinos(Origen,Destino, Grafo), Adyacentes).

%Mostrar el conjunto de aristas/arcos del grafo (de manera formateada, no solo la lista)
mostrar_aristas(Grafo) :-
    grafo(Grafo, Aristas), % Obtener la lista de aristas del grafo
    write('Aristas'), nl, % Encabezado
    mostrar_aristas_aux(Aristas).
mostrar_aristas_aux([]). % Caso base, no hay aristas que mostrar
mostrar_aristas_aux([Arista|Resto]) :-
    write(Arista), write('. '), % Mostrar la arista seguida de un punto y espacio
    mostrar_aristas_aux(Resto).

%Imprimir la lista de nodos existentes en el grafo, es decir, solo aquellos que lo componen y sin repeticiones
vertices(G,Ln) :-   
    %bagof - devuelve una lista con los datos consultados
    %bagof(N1,N2^vecinos(N1,N2,G), Ln).
    %setof - devuelve una lista con los datos consultados aplicando sort
    setof(N1,N2^vecinos(N1,N2,G), Ln).

%Mostrar la cantidad de nodos/vértices en el grafo
cant_nodos(G) :- 
    vertices(G,L),
    length(L, C),
    write('Cantidad de vertices en el grafo '), 
    write(G), 
    write(': '),
    write(C), nl.

% Mostrar la cantidad de aristas/arcos en el grafo
cant_aristas(G) :- 
    grafo(G, L), 
    length(L, C), 
    write('Cantidad de aristas en el grafo '), 
    write(G), 
    write(': '), 
    writeln(C).

%Verifica si la el nodo existe en el grafo
nodo_existente(N,G) :- vertices(G,L), member(N,L), !.

%Realizar el recorrido entre un punto de partida (origen) y otro destino
camino(Grafo, Origen, Destino, Camino) :- camino(Grafo, Origen, Destino, [Origen], Camino).

% Caso base: el destino es el nodo actual
camino(_, Nodo, Nodo, Visitados, Visitados).

% Caso recursivo
camino(Grafo, Origen, Destino, Visitados, Camino) :-
    vecinos(Origen, NodoIntermedio, Grafo),
    \+ member(NodoIntermedio, Visitados), % Asegurarse de no visitar el mismo nodo dos veces
    camino(Grafo, NodoIntermedio, Destino, [NodoIntermedio | Visitados], Camino).

% Predicado para guardar el grafo en un archivo
guardar :-
    tell('nodos.pl'),
    listing(grafo/2),
    told,
    write('Grafo guardado en el archivo.').

inicio :- consult('nodos.pl').

%Crea el grafo con la conexion que se le indique en los parametros
crear_Grafo(N1,N2,Ngrafo):- \+grafo(Ngrafo,_), assert(grafo(Ngrafo,[])), agregar_Nodos(N1,N2,Ngrafo).

%Agrega conexiones en el grafo que se le indique en los parametros
agregar_Nodos(N1,N2,Ngrafo):- grafo(Ngrafo,Lista), insertar(N1-N2,Lista,ListaRes),retract(grafo(Ngrafo,Lista)), agregar_Bc(Ngrafo,ListaRes).

%Revisa que una conexion de nodos existe o no, sino, la crea
conexion_Grafo(N1,N2,Ngrafo):- 
    grafo(Ngrafo,Lista),
    not(member(N1-N2,Lista)), 
    write('Agregando nueva conexion al grafo'),nl,
    agregar_Nodos(N1,N2,Ngrafo).
conexion_Grafo(N1,N2,Ngrafo):- 
    grafo(Ngrafo,Lista),
    member(N1-N2,Lista), 
    write('Esta conexion ya han sido agregados').

%Agrega el grafo en la base de conocimientos
agregar_Bc(Ngrafo,Lista):- 
    assert(grafo(Ngrafo,Lista)),
    guardar.
%Inserta nuevos valores en la lista, en este caso, las conexiones entre nodos
insertar(E,L,Lr):- Lr = [E|L].