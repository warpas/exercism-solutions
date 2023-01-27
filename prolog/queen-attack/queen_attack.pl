% Please visit https://exercism.io/tracks/prolog/installation
% for instructions on setting up prolog.
% Visit https://exercism.io/tracks/prolog/tests
% for help running the tests for prolog exercises.

% Replace the goal below with
% your implementation.

%! create(+DimTuple)
%
% The create/1 predicate succeeds if the DimTuple contains valid chessboard
% dimensions, e.g. (0,0) or (2,4).
create((DimX, DimY)) :-
	DimX < 8,
	DimX > 0,
	DimY < 8,
	DimY > 0.

%! attack(+FromTuple, +ToTuple)
%
% The attack/2 predicate succeeds if a queen positioned on ToTuple is
% vulnerable to an attack by another queen positioned on FromTuple.
attack((FromX, _), (ToX, _)):-
	FromX = ToX, !.
attack((_, FromY), (_, ToY)):-
	FromY = ToY, !.
attack((FromX, FromY), (ToX, ToY)):-
	diagonalAttackUpLeft((FromX, FromY), (ToX, ToY)), !.
attack((FromX, FromY), (ToX, ToY)):-
	diagonalAttackUpRight((FromX, FromY), (ToX, ToY)), !.
attack((FromX, FromY), (ToX, ToY)):-
	diagonalAttackDownRight((FromX, FromY), (ToX, ToY)), !.
attack((FromX, FromY), (ToX, ToY)):-
	diagonalAttackDownLeft((FromX, FromY), (ToX, ToY)), !.

diagonalAttackUpLeft((FromX, FromY), (FromX, FromY)) :- !.
diagonalAttackUpLeft((FromX, FromY), (ToX, ToY)) :-
	FromX >= 0,
	FromY >= 0,
	FromX < 7,
	FromY < 7,
	NextFromX is FromX - 1,
	NextFromY is FromY + 1,
	diagonalAttackUpLeft((NextFromX, NextFromY), (ToX, ToY)).

diagonalAttackUpRight((FromX, FromY), (FromX, FromY)) :- !.
diagonalAttackUpRight((FromX, FromY), (ToX, ToY)) :-
	FromX >= 0,
	FromY >= 0,
	FromX < 7,
	FromY < 7,
	NextFromX is FromX + 1,
	NextFromY is FromY + 1,
	diagonalAttackUpRight((NextFromX, NextFromY), (ToX, ToY)).

diagonalAttackDownRight((FromX, FromY), (FromX, FromY)) :- !.
diagonalAttackDownRight((FromX, FromY), (ToX, ToY)) :-
	FromX >= 0,
	FromY >= 0,
	FromX < 7,
	FromY < 7,
	NextFromX is FromX + 1,
	NextFromY is FromY - 1,
	diagonalAttackDownRight((NextFromX, NextFromY), (ToX, ToY)).

diagonalAttackDownLeft((FromX, FromY), (FromX, FromY)) :- !.
diagonalAttackDownLeft((FromX, FromY), (ToX, ToY)) :-
	FromX >= 0,
	FromY >= 0,
	FromX < 7,
	FromY < 7,
	NextFromX is FromX - 1,
	NextFromY is FromY - 1,
	diagonalAttackDownLeft((NextFromX, NextFromY), (ToX, ToY)).
