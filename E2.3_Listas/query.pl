% INTEGRANTES
% Aguas Montaño Sergio José - 217815601
% González Ramírez Joselin - 217591754
% Guijarro Rocha Aníbal Uriel - 217590693

inicio :- consult('baseConocimientos.pl'), menu, !.

menu :- write("\n\n"),
        write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
        write("|                                                                           |\n"),
        write("|                     MENU (Figuras geometricas)                            |\n"),
        write("|                                                                           |\n"),
        write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
        write("|                          1. Mostrar todo                                  |\n"),
        write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
        write("|                          2. Agregar                                       |\n"),
        write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
        write("|                          3. Buscar por nombre                             |\n"),
        write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
        write("|                          4. Buscar por lados                              |\n"),
        write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
        write("|                          5. Eliminar                                      |\n"),
        write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
        write("|                          6. Eliminar todo                                 |\n"),
        write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
        write("|                          7. Modificar                                     |\n"),
        write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
        write("|                          8. Guardar cambios                               |\n"),
        write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
        write("|                          9. Salir y guardar                               |\n"),
        write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
        write("\nEJEMPLO DE SELECCION: 1. (Numero de opcion seguido de un punto)\n"),
        read(Opc),
        opcion(Opc).

% OPCIONES DEL MENÚ
opcion(Opc) :-  (Opc < 1 ; Opc >9), write("\n\n>> Opcion incorrecta, intentalo de nuevo <<"), menu. % Opción 'default' ---> En caso de colocar opción incorrecta


opcion(1) :-    mostrar, menu.


opcion(2) :-    mensaje,
                write("\n\nIngresa el nombre de la figura a agregar:\n"),
                read(Nombre_fig),
                write("\nNumero de lados de la figura:\n"),
                read(Lados_fig),
                (
                    figura(Nombre_fig, Lados_fig) ->
                        write("\n\n>> La figura ya existe en la base de conocimientos <<\n"),
                        menu
                    ;
                        agregar(Nombre_fig, Lados_fig),
                        write("\n\n"), write(Nombre_fig), write(" se ha agregado correctamente!!"),
                        menu
                ).


opcion(3) :-    mensaje,
                write("Ingresa el nombre de la figura a buscar:\n"),
                read(Nombre_fig),
                buscarNombre(Nombre_fig),
                menu.


opcion(4) :-    mensaje,
                write("Ingresa el numero de lados de la figura a buscar:\n"),
                read(Lados_fig),
                buscarLados(Lados_fig),
                menu.


opcion(5) :-    mensaje,
                write("Ingresa el nombre de la figura a eliminar:\n"),
                read(Nombre_fig),
                (
                    \+figura(Nombre_fig, _) ->
                        write("\n\n>> La figura no existe en la base de conocimientos <<\n"),
                        menu
                    ;
                        eliminar(Nombre_fig),
                        write("\n"), write(Nombre_fig), write(" eliminado correctamente!!"),
                        menu
                ).
                

opcion(6) :-    mensaje,
                write("¿Realmente deseas eliminar todas las figuras? (s/n): "),
                read(Respuesta),
                (
                    Respuesta = 's' ->
                        eliminarTodo,
                        menu
                    ;
                        write("\n>> Eliminacion de figuras cancelada <<\n"),
                        menu
                ).


opcion(7) :-    mensaje,
                write("Ingresa el nombre de la figura a modificar:\n"),
                read(Nombre_fig),
                (
                    figura(Nombre_fig, _) ->
                    write("Ingresa el nuevo nombre de la figura a modificar:\n"),
                    read(Nombren_fig),
                    write("Sus lados:\n"),
                    read(Lado_fig),
                    eliminar(Nombre_fig),
                    agregar(Nombren_fig, Lado_fig),
                    write("\n\nElemento modificado correctamente en la base de conocimientos!!"),
                    menu
                ;
                write("\n>> La figura que intentas modificar no existe en la base de conocimientos <<\n"),
                menu
                ).


opcion(8) :-    guardar, menu.


opcion(9) :-    limpiar, guardar, write("\n\nMUCHAS GRACIAS, HASTA LUEGO!!").


% MÉTODOS
mostrar :-  listing(figura/2).

agregar(A,B) :- assert(figura(A,B)).

eliminar(A) :- retract(figura(A,_)).
eliminar(A) :- write("\n>> "), write(A), write(" no existe en la base de conocimientos <<\n").

eliminarTodo :- retractall(figura(_, _)), write("\nTodas las figuras han sido eliminadas!!").

buscarNombre(A) :-  figura(A,B), write("\nNOMBRE: "), write(A), write(" -> NUMERO DE LADOS: "), write(B), write("\n").
buscarNombre(A) :-  write("\n\n>> Figura no encontrada <<\n"),
                    write("Deseas agregar esta nueva figura a la base de conocimientos? (s/n): "),
                    read(Respuesta),
                    (
                        Respuesta = 's' ->
                            write("Ingresa el numero de lados de "), write(A), write(": \n"),
                            read(B),
                            agregar(A,B)
                        ;
                            write("\n>> No se ha agregado la figura a la base de conocimientos <<\n")
                    ).

buscarLados(B) :-
    forall(figura(Figura, B), mostrar_figura(Figura, B)),
    (
        figura(_, B) ->
            true
        ;
            write("\n\n>> Numero de lados no encontrado <<\n"),
            write("Deseas agregar una nueva figura con "), write(B), write(" lados? (s/n): "),
            read(Respuesta),
            (
                Respuesta = 's' ->
                    write("Ingresa el nombre de la nueva figura: \n"),
                    read(NuevaFigura),
                    agregar(NuevaFigura, B),
                    write("\n>> Nueva figura agregada a la base de conocimientos <<\n")
                ;
                    write("\n>> No se ha agregado la figura a la base de conocimientos <<\n")
            )
    ).

mostrar_figura(Figura, B) :-
    write("\nNOMBRE: "), write(Figura),
    write(" -> NUMERO DE LADOS: "), write(B), write("\n").


buscar(A,B) :-  respuesta(A,B), !.


respuesta(A,B) :- figura(A,B), write("\nNOMBRE: "), write(A), write(" -> NUMERO DE LADOS "), write(B), write("\n").
respuesta(A,B) :-
    write("\n\n>> Figura no encontrada <<\n"),
    write("Deseas agregar esta figura a la base de conocimientos? (s/n): "),
    read(Respuesta),
    (
        Respuesta = 's' ->
            agregar(A,B),
            write("Figura agregada a la base de conocimientos.\n")
        ;
            write("\n>> No se ha agregado la figura a la base de conocimientos <<\n")
    ).


guardar :- tell('baseConocimientos.pl'),
    listing(figura/2),
    told,
    write("\n\nElementos guardados correctamente en la base de conocimientos!!").

limpiar :- write('\033[2J').

mensaje :-  write("\n\n"),
            write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n"),
            write("|                                                                           |\n"),
            write("|        Recuerda que al final de cada palabra debe escribir                |\n"),
            write("|        un punto (.) para ser ejecutado [ EJEMPLO: triangulo. ]            |\n"),
            write("|                                                                           |\n"),
            write("|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\n").
