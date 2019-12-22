% Máquina de inferencias de parentezco familiar

% ; = OR
% , = AND


% Base de conocimiento
% Definición de progenitor
progenitor(tom, bob).
progenitor(tomasa, bob).
progenitor(fili, tom).
progenitor(martha, tom).
progenitor(armando, fili).
progenitor(andrea, fili).
progenitor(ismael, martha).
progenitor(ana, tomasa).
progenitor(bruno, tomasa).
progenitor(rene, ana).
progenitor(laura, ana).
progenitor(domitila, bruno).
progenitor(gustavo, bruno).
progenitor(tomasa, salvador).
progenitor(fili, maria).
progenitor(armando, pam).
progenitor(bruno, samantha).
progenitor(tom, salvador).
progenitor(andrea, pam).
progenitor(ismael, isabel).
progenitor(domitila, martha).
progenitor(andrea, pam).

% Género masculino
hombre(tom).
hombre(bob).
hombre(fili).
hombre(armando).
hombre(ismael).
hombre(bruno).
hombre(rene).
hombre(gustavo).
hombre(salvador).

% Género femenino
mujer(tomasa).
mujer(domitila).
mujer(martha).
mujer(ana).
mujer(laura).
mujer(maria).
mujer(samantha).
mujer(andrea).
mujer(pam).
mujer(isabel).

hermana(Y, Z) :-
	mujer(Y),
	progenitor(X, Y),
	progenitor(X, Z),
	Y \= Z.

hermano(Y, Z) :-
	hombre(Y),
	progenitor(X, Y),
	progenitor(X, Z),
	Y \= Z.

tio(X, Y) :-
	hombre(X),
	progenitor(Z, Y),
	progenitor(W, Z),
	progenitor(W, X).

tia(X, Y) :-
	mujer(X),
	progenitor(Z, Y),
	progenitor(W, Z),
	progenitor(W, X).

ancestro(X, Y) :-
	progenitor(X, Y).

ancestro(X, Y) :-
	progenitor(Z, Y),
	ancestro(X,Z).

abuelo(X, Y) :-
	hombre(X),
	progenitor(Z, Y),
	progenitor(X, Z).

abuela(X, Y) :-
	mujer(X),
	progenitor(Z, Y),
	progenitor(X, Z).

primo(X, Y) :-
	hombre(X),
	progenitor(W, X),
	progenitor(Z, Y),
	(hermana(Z, W); hermano(Z, W)),
	write(X), write(" es primo de "), write(Y).

prima(X, Y) :-
	mujer(X),
	progenitor(W, X),
	progenitor(Z, Y),
	(hermana(Z, W); hermano(Z,W)).
