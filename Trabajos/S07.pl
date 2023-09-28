% Esto es un comentario
%
% write("Hello World!").

limpiar:- write('\033[2J').

% Hechos
planeta(venus).
planeta(tierra).
planeta(jupiter).
planeta(marte).
planeta(mercurio).

mamifero(leon).
mamifero(tigre).
mamifero(perro).
mamifero(gato).
mamifero(ballena).
mamifero(jirafa).
mamifero(lobo).

% Reglas
come(leon,carne).
come(tigre,carne).
come(puma,carne).
come(ballena,peces).

saludo :- nl, write('Hola Mundo...'), nl.

% Uificación Retroceso
carnivoro(A) :- mamifero(A) , come(A,carne).

programador(hugo).
programador(paco).
programador(luis).

usa_lenguaje(paco,js).
usa_lenguaje(paco,python).
usa_lenguaje(luis,r).
usa_lenguaje(luis,python).

candidato(P,L) :- programador(P) , usa_lenguaje(P,L).
candidato(P,L1,L2) :- programador(P), (usa_lenguaje(P,L1) ; usa_lenguaje(P,L2)) , !.

suma(A,B) :- R is A+B, write(R).
suma(A,B,R) :- R is A+B.
suma :- nl, write('Valor 1: '), read(A), nl, write('Valor 2: '), read(B), nl, suma(A,B), nl.

pitagoras(A,B,C) :- C is ((A^2)+(B^2))^(1/2).

