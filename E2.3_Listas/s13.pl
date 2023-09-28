%Listas

%Simple
mamiferos([leon,perro,tigre,caballo]).
semana([lunes,martes,miercoles,jueves,viernes,sabado,domingo]).

%Listas de listas
animales(
    [leon,tigre,jaguar], %Carnivoro
    [caballo],  %Vegetariano
    [perro,oso], %Omnivoro
    [oso_hormiguero] %Insectivoro
    ).

%Listas como relacion
animales(carnivoro,[lobo,leopardo,leon]).
animales(insectivoros,[rana,camaleon]).

%Listas y elementos
platillos([pozole,pozolillo,menudo],tamales,[chile_relleno,chile_nogada],barbacoa).

%Vectores
vector([1,2,3],[x,y,z]).

%Operaciones
%Comprobar
lista([H|T]).
lista([H|T]) :- wirte(H), nl, lista(T).

%Agregar
agregar(E, [H|_]) :- asserta(E, H).
agregar(E, [_,T]) :- agregar(E,T).