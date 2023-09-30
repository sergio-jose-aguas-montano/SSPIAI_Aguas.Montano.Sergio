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
        write("|                          5. Eliminar de lista                             |\n"),
        write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
        write("|                          6. Longitud de lista                             |\n"),
        write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
        write("|                          7. Ordenar lista                                 |\n"),
        write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
        write("|                          8. Salir                                         |\n"),
        write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
        write("\nEJEMPLO DE SELECCION: 1. (Numero de opcion seguido de un punto)\n"),
        read(Opc),
        opcion(Opc).

% OPCIONES DEL MENÚ
opcion(Opc) :-  (
                    (Opc < 1);
                    (Opc > 8)
                ), 
                write("\n\n>> Opcion incorrecta, intentalo de nuevo <<"),
                menu. % Opción 'default' ---> En caso de colocar opción incorrecta

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

opcion(2) :-menu_listas,
            write("\nSelecciona la lista a enlistar elementos:"),
            read(Enlistar),
            (
                (Enlistar = 1 -> figuras(X));
                (Enlistar = 2 -> colores(X));
                (Enlistar = 3 -> nombres(X));
                (Enlistar = 4 -> numeros(X));
                (Enlistar = 5 -> letras(X))
            ),
            enlistarElementos(X), % Llama al predicado para enlistar elementos
            menu.

opcion(3) :- menu_listas,
    write("\nIngresa el umero de la primera lista a concatenar:\n"),
    read(Numero_lista1),
    (
        (Numero_lista1 = 1 -> figuras(X));
        (Numero_lista1 = 2 -> colores(X));
        (Numero_lista1 = 3 -> nombres(X));
        (Numero_lista1 = 4 -> numeros(X));
        (Numero_lista1 = 5 -> letras(X))
    ),
    write("\nIngresa el numero de la segunda lista a concatenar:\n"),
    read(Numero_lista2),
    (
        (Numero_lista2 = 1 -> figuras(Y));
        (Numero_lista2 = 2 -> colores(Y));
        (Numero_lista2 = 3 -> nombres(Y));
        (Numero_lista2 = 4 -> numeros(Y));
        (Numero_lista2 = 5 -> letras(Y))
    ),
    concatenar(X, Y, Resultado),
    write("\nResultado de la concatenacion:\n"),
    write(Resultado),
    menu. % Vuelve al menú principal


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

opcion(5) :- menu_listas,
    write("\nIngresa el numero de la lista a eliminar el elemento:\n"),
    read(Eliminar_elemento),
    (
        (Eliminar_elemento = 1 -> figuras(Y));
        (Eliminar_elemento = 2 -> colores(Y));
        (Eliminar_elemento = 3 -> nombres(Y));
        (Eliminar_elemento = 4 -> numeros(Y));
        (Eliminar_elemento = 5 -> letras(Y))
    ),
    write("\nElementos de la lista seleccionada:\n"),
    enlistarElementos(Y),
    write("\nIngresa el elemento a eliminar:\n"),
    read(Elemento),
    (
        (Eliminar_elemento = 1 -> eliminarFigura(Elemento));
        (Eliminar_elemento = 2 -> eliminarColor(Elemento));
        (Eliminar_elemento = 3 -> eliminarNombre(Elemento));
        (Eliminar_elemento = 4 -> eliminarNumero(Elemento));
        (Eliminar_elemento = 5 -> eliminarLetra(Elemento))
    ),
    menu.

opcion(6) :- menu_listas,
    write("\nSelecciona el numero de la lista a contar elementos (longitud):\n"),
    read(Lista_largo),
    (
        (Lista_largo = 1 -> figuras(Y));
        (Lista_largo = 2 -> colores(Y));
        (Lista_largo = 3 -> nombres(Y));
        (Lista_largo = 4 -> numeros(Y));
        (Lista_largo = 5 -> letras(Y))
    ),
    longitud(Y, Longitud), % Usar el predicado longitud/2
    write("\nLa longitud de la lista seleccionada es: "), write(Longitud), nl, % Mostrar la longitud
    menu.

opcion(7) :-
            menu_listas,
            write("\nIngresa el numero de la lista a ordenar:\n"),
            read(Lista_ordenar),
            (
                (Lista_ordenar = 1 -> figuras(X));
                (Lista_ordenar = 2 -> colores(X));
                (Lista_ordenar = 3 -> nombres(X));
                (Lista_ordenar = 4 -> numeros(X));
                (Lista_ordenar = 5 -> letras(X))
            ),
            write("\nLista original:\n"),
            enlistarElementos(X), % Muestra la lista original
            sort(X, ListaOrdenada), % Ordena la lista
            write("\nLista ordenada:\n"),
            enlistarElementos(ListaOrdenada), % Muestra la lista ordenada
            menu.

opcion(8):- write("\nGracias por usar el programa! :D").

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

% Predicado para concatenar dos listas
concatenar([], Lista, Lista).
concatenar([X|Resto1], Lista2, [X|Resultado]) :- concatenar(Resto1, Lista2, Resultado).

% Predicado para enlistar elementos de una lista uno por uno
enlistarElementos([]) :- !.
enlistarElementos([Elemento|Resto]) :-
    write(Elemento), nl, % Imprime el elemento y un salto de línea
    enlistarElementos(Resto).

% Predicado para eliminar un elemento de una lista
eliminarAlgo(Elemento, [Elemento|Resto], Resto) :- !.
eliminarAlgo(Elemento, [Cabeza|Resto], [Cabeza|NuevaResto]) :-
    eliminarAlgo(Elemento, Resto, NuevaResto).

% Predicado para eliminar un elemento de una lista de acuerdo a la estructura proporcionada
eliminarFigura(Elemento) :-
    figuras(Y), % Obtener la lista de figuras
    eliminarAlgo(Elemento, Y, NuevaLista), % Llamar al predicado eliminarAlgo
    retract(figuras(_)), % Retirar la lista anterior
    asserta(figuras(NuevaLista)), % Almacenar la nueva lista
    guardar.

eliminarColor(Elemento) :-
    colores(Y), % Obtener la lista de figuras
    eliminarAlgo(Elemento, Y, NuevaLista), % Llamar al predicado eliminarAlgo
    retract(colores(_)), % Retirar la lista anterior
    asserta(colores(NuevaLista)), % Almacenar la nueva lista
    guardar.

eliminarNombre(Elemento) :-
    nombres(Y), % Obtener la lista de figuras
    eliminarAlgo(Elemento, Y, NuevaLista), % Llamar al predicado eliminarAlgo
    retract(nombres(_)), % Retirar la lista anterior
    asserta(nombres(NuevaLista)), % Almacenar la nueva lista
    guardar.

eliminarNumero(Elemento) :-
    numeros(Y), % Obtener la lista de figuras
    eliminarAlgo(Elemento, Y, NuevaLista), % Llamar al predicado eliminarAlgo
    retract(numeros(_)), % Retirar la lista anterior
    asserta(numeros(NuevaLista)), % Almacenar la nueva lista
    guardar.

eliminarLetra(Elemento) :-
    letras(Y), % Obtener la lista de figuras
    eliminarAlgo(Elemento, Y, NuevaLista), % Llamar al predicado eliminarAlgo
    retract(letras(_)), % Retirar la lista anterior
    asserta(letras(NuevaLista)), % Almacenar la nueva lista
    guardar.

% Longitud
% longitud([perro,gato,raton],L).
longitud([],0).
longitud([_|T], L) :- longitud(T, Lc), L is Lc + 1.

guardar :-  tell('baseConocimientos.pl'), 
            listing(figuras/1), 
            listing(colores/1), 
            listing(nombres/1), 
            listing(numeros/1), 
            listing(letras/1), 
            told.