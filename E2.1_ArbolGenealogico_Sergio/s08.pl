hombre('Sergio').
hombre('Sergiojr').
hombre('Cristian').
hombre('Isidro').
hombre('Abelino').
hombre('Guillermo').
hombre('Gabriel').
hombre('Andres').
hombre('Oscar').

mujer('Matilde').
mujer('Melanie').
mujer('Karem').
mujer('Jovita').
mujer('Teresa').
mujer('Tere').
mujer('Juana').

% Progenitores
progenitor('Isidro','Matilde').
progenitor('Isidro','Guillermo').
progenitor('Isidro','Tere').
progenitor('Abelino','Gabriel').
progenitor('Abelino','Sergio').
progenitor('Abelino','Andres').
progenitor('Sergio','Sergiojr').
progenitor('Sergio','Cristian').
progenitor('Sergio','Karem').
progenitor('Sergio','Melanie').
progenitor('Gabriel','Oscar').

progenitor('Jovita','Sergio').
progenitor('Jovita','Gabriel').
progenitor('Jovita','Andres').
progenitor('Teresa','Guillermo').
progenitor('Teresa','Matilde').
progenitor('Teresa','Tere').
progenitor('Matilde','Sergiojr').
progenitor('Matilde','Cristian').
progenitor('Matilde','Karem').
progenitor('Matilde','Melanie').
progenitor('Juana','Oscar').

% Relacion/Parentesco
padre(P,H) :- progenitor(P,H), hombre(P).
madre(M,H) :- progenitor(M,H), mujer(M).

hijo(H,P) :- progenitor(P,H), hombre(H).

abuelo(A,N) :- progenitor(A,P), progenitor(P,N), hombre(A).
abuelo_pat(A,N) :- padre(A,P), padre(P,N).
abuelo_mat(A,N) :- padre(A,M), madre(M,N).

abuela(A,N) :- progenitor(A,M), progenitor(M,N), mujer(A).
abuela_pat(A,N) :- madre(A,P), padre(P,N).
abuela_mat(A,N) :- madre(A,M), madre(M,N).

abuelos_pat(Ao,Aa,N) :- abuelo_pat(Ao,N), abuela_pat(Aa,N).
abuelos_mat(Ao,Aa,N) :- abuelo_mat(Ao,N), abuela_mat(Aa,N).

hermanos(H1,H2) :- padre(P,H1), padre(P,H2), H1\=H2.

%tio(T,S) :- hermanos(T,X), padre(X,S), hombre(T), T\=X.
%tia(T,S) :- hermanos(T,X), madre(X,S), mujer(T), T\=X.

tio(T, S) :- (hermanos(T, X), padre(X, S), hombre(T), T\=X) ; (hermanos(T, Y), madre(Y, S), hombre(T), T\=Y).
tia(T, S) :- (hermanos(T, X), madre(X, S), mujer(T), T\=X) ; (hermanos(T, Y), padre(Y, S), mujer(T), T\=Y).


% primos(P1, P2) :- abuelos_mat(AM1, AM2, P1), abuelos_pat(AP1, AP2, P2),
% AM1 \= AP1, AM2 \= AP2.

% primos(P1, P2) :- abuelo_mat(AM, P1), abuelo_pat(AP, P2),
% abuelo_mat(AM, P2), abuelo_pat(AP, P1), P1 \= P2, \+ hermanos(P1, P2).

primos(P1, P2) :- P1\=P2, abuelos_mat(AM1, AM2, P1),abuelos_pat(AP1, AP2, P2),AM1 \= AP1,AM2 \= AP2,\+ hermanos(P1, P2).

primos(P1, P2) :- P1\=P2, abuelos_mat(AM1, AM2, P2),abuelos_pat(AP1, AP2, P1),AM1 \= AP1,AM2 \= AP2,\+ hermanos(P1, P2).

primos(Persona, Primos) :- findall(Primo, (primos(Persona, Primo), Persona \= Primo), Primos).
