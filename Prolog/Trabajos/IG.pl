:- use_module(library(pce)).

%Interfaz
%Valores contenido
dialogo(Titulo, Etiqueta, Imagen) :-
    new(D, dialog(Titulo)),
    mostrar(D, Imagen, 300, 150),
    new(L, label(n,'')),
    send(D, append(label(n,Etiqueta))),
    send(D, append, L),
    send(D, open).

%Control de la ventana
mostrar(D, Imagen, X, Y) :-
    new(I, image(Imagen)),
    new(B, bitmap(I)),
    new(F, figure),
    send(F, display, B),
    new(De, device),
    send(De, display, F),
    send(D, display, De),
    send(D, display, De, point(X, Y)).

imagen :- dialogo('Grafo maton', 'Viejo conocido', 'perro.jpg').

% Este metodo me funciona en mi laptop, no detecta la imagen a menos que
% sea por ruta directa
% imagen :- dialogo('Grafo maton', 'Viejo
% conocido', 'E:\\Personal\\UNI\\7mo
% Semestre\\SSPIA\\Prolog\\Trabajos\\perro.jpg').
