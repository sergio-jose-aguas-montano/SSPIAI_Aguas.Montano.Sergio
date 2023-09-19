%arity - aridad
%dynamic
%assert, asserta, assertz
%retract, retractall, abolish
%_ - Variable Anonima
%tell, listing, told
%
:- dynamic mamifero/1.
mamifero(delfin).
mamifero(leon).

%listing(mamifero) regresa todos los predicados
:- dynamic mamifero/2.
mamifero(tigre,carnivoro).
mamifero(oso,omnivoro).
mamifero(puma,carnivoro).
