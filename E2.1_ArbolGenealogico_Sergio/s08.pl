hombre('Sergio').
hombre('Sergiojr').
hombre('Cristian').
hombre('Isidro').
hombre('Abelino').
hombre('Guillermo').
hombre('Gabriel').
hombre('Andrés').

mujer('Matilde').
mujer('Melanie').
mujer('Karem').
mujer('Jovita').
mujer('Teresa').

% Progenitores
progenitor('Isidro','Matilde').
progenitor('Isidro','Guillermo').
progenitor('Abelino','Gabriel').
progenitor('Abelino','Sergio').
progenitor('Abelino','Andrés').
progenitor('Sergio','Sergiojr').
progenitor('Sergio','Cristian').
progenitor('Sergio','Karem').
progenitor('Sergio','Melanie').

progenitor('Jovita','Sergio').
progenitor('Jovita','Gabriel').
progenitor('Jovita','Andrés').
progenitor('Teresa','Guillermo').
progenitor('Teresa','Matilde').
progenitor('Matilde','Sergiojr').
progenitor('Matilde','Cristian').
progenitor('Matilde','Karem').
progenitor('Matilde','Melanie').

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

tio_mat(T,S) :- madre(M,S), findall(Tio, (hermano(Tio,M), hombre(Tio)), Tios), list_to_set(Tios,T).
tio_pat(T,S) :- padre(P,S), findall(Tio, (hermano(Tio,P), hombre(Tio)), Tios), list_to_set(Tios,T).

hermano(H,S) :- progenitor(P,H), progenitor(P,S), H \= S, hombre(H).
