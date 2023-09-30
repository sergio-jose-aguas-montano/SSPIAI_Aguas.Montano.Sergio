% Autor: Aguas Montaño Sergio José - 217815601
pruebas :- consult('baseConocimientos.pl'), !.

agregar(E, [], [E]) :- !.
agregar(E, [H|T], [H|L]) :- agregar(E, T, L).

inicio :- consult('baseConocimientos.pl'), menu, !.

menu :- write("\n\n"),
        write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
        write("|                                                                           |\n"),
        write("|                     MENU (Opciones con listas)                            |\n"),
        write("|                                                                           |\n"),
        write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
        write("|                          1. Buscar en lista                               |\n"),
        write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
        write("|                          2. Comprobar/Listar                              |\n"),
        write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
        write("|                          3. Concatenar 2 listas                           |\n"),
        write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
        write("|                          4. Agregar a lista                               |\n"),
        write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
        write("|                          6. Eliminar de lista                             |\n"),
        write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
        write("|                          7. Longitud de lista                             |\n"),
        write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
        write("|                          8. Ordenar lista                                 |\n"),
        write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
        write("|                          9. Salir                                         |\n"),
        write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
        write("\nEJEMPLO DE SELECCION: 1. (Numero de opcion seguido de un punto)\n"),
        read(Opc),
        opcion(Opc).

% OPCIONES DEL MENÚ
opcion(Opc) :-  (Opc < 1 ; Opc >9), write("\n\n>> Opcion incorrecta, intentalo de nuevo <<"), menu. % Opción 'default' ---> En caso de colocar opción incorrecta

menu_listas :-  mensaje,
                write("|                        1. Figuras                                         |\n"),
                write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
                write("|                        2. Colores                                         |\n"),
                write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
                write("|                        3. Nombres                                         |\n"),
                write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
                write("|                        4. Numeros                                         |\n"),
                write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
                write("|                        5. Letras                                          |\n"),
                write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n").

opcion(1) :- menu_listas,
    write("\nIngresa el numero de la lista a buscar el elemento:\n"),
    read(Numero_lista),
    write("\nIngresa el elemento a buscar:\n"),
    read(Elemento),
    (
        (Numero_lista = 1 -> figuras(X), buscarOAgregar(X, Elemento, Numero_lista));
        (Numero_lista = 2 -> colores(X), buscarOAgregar(X, Elemento, Numero_lista));
        (Numero_lista = 3 -> nombres(X), buscarOAgregar(X, Elemento, Numero_lista));
        (Numero_lista = 4 -> numeros(X), buscarOAgregar(X, Elemento, Numero_lista));
        (Numero_lista = 5 -> letras(X), buscarOAgregar(X, Elemento, Numero_lista))
    ),
    menu. % Vuelve al menú principal
                
% Predicado para buscar o agregar un elemento en la lista
buscarOAgregar(X, Elemento, Numero_lista) :-
    buscar(Elemento, X),
    write("\n*****      Elemento encontrado en la lista.      *****\n").
            
buscarOAgregar(X, Elemento, Numero_lista) :-
    \+ buscar(Elemento, X), % Verifica que el elemento no esté presente
    write("Elemento no encontrado en la lista.\n"),
    write("Deseas agregar el elemento a la lista? (si/no): "),
    read(Respuesta),
    (
        Respuesta = 'si' -> (
            (
                (Numero_lista = 1 -> nuevoFigura(Elemento));
                (Numero_lista = 2 -> nuevoColor(Elemento));
                (Numero_lista = 3 -> nuevoNombre(Elemento));
                (Numero_lista = 4 -> nuevoNumero(Elemento));
                (Numero_lista = 5 -> nuevoLetra(Elemento))
            ),
            write("\n*****      Elemento agregado a la lista.     *****\n")
        );
        Respuesta = 'no' -> write("Elemento no agregado a la lista.\n")
    ).
            
    

opcion(4) :- menu_listas,
             write("\nIngresa el numero de la lista a agregar el elemento:\n"),
             read(Numero_lista),
             write("\nIngresa el elemento a agregar:\n"),
             read(Elemento),
             (
                (Numero_lista = 1 -> nuevoFigura(Elemento));
                (Numero_lista = 2 -> nuevoColor(Elemento));
                (Numero_lista = 3 -> nuevoNombre(Elemento));
                (Numero_lista = 4 -> nuevoNumero(Elemento));
                (Numero_lista = 5 -> nuevoLetra(Elemento))
             ),
             menu.

opcion(9):- write("\nGracias por usar el programa! :D").


mensaje :-  write("\n\n"),
            write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
            write("|                                                                           |\n"),
            write("|        Recuerda que al final de cada palabra debe escribir                |\n"),
            write("|        un punto (.) para ser ejecutado [ EJEMPLO: ejemplo. ]              |\n"),
            write("|                                                                           |\n"),
            write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n").

%Metodos
%Comprobar que la lista sea una lista
lista([]).
lista([_|T]) :- lista(T).

% Buscar
buscar(X, [X|_]) :- !.
buscar(X, [_|Ys]):- buscar(X, Ys).

% Agregar
inserta([],X,[X]).
inserta([H|T], N, [H|R]) :- inserta(T, N, R).
nuevoNumero(Y) :-
    retract(numeros(X)), % Retiramos la lista anterior
    inserta(X, Y, Nueva), % Insertamos el nuevo elemento en la lista anterior
    asserta(numeros(Nueva)), !, % Almacenamos la nueva lista con el nuevo elemento
    guardar.

nuevoFigura(Y) :-
    retract(figuras(X)), % Retiramos la lista anterior
    inserta(X, Y, Nueva), % Insertamos el nuevo elemento en la lista anterior
    asserta(figuras(Nueva)), !, % Almacenamos la nueva lista con el nuevo elemento
    guardar.

nuevoColor(Y) :-
    retract(colores(X)), % Retiramos la lista anterior
    inserta(X, Y, Nueva), % Insertamos el nuevo elemento en la lista anterior
    asserta(colores(Nueva)), !, % Almacenamos la nueva lista con el nuevo elemento
    guardar.

nuevoNombre(Y) :-
    retract(nombres(X)), % Retiramos la lista anterior
    inserta(X, Y, Nueva), % Insertamos el nuevo elemento en la lista anterior
    asserta(nombres(Nueva)), !, % Almacenamos la nueva lista con el nuevo elemento
    guardar.

nuevoLetra(Y) :-
    retract(letras(X)), % Retiramos la lista anterior
    inserta(X, Y, Nueva), % Insertamos el nuevo elemento en la lista anterior
    asserta(letras(Nueva)), !, % Almacenamos la nueva lista con el nuevo elemento
    guardar.

guardar :-  tell('baseConocimientos.pl'), 
            listing(figuras/1), 
            listing(colores/1), 
            listing(nombres/1), 
            listing(numeros/1), 
            listing(letras/1), 
            told.