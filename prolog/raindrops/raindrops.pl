convert(N, "PlingPlangPlong") :-
  Nmod105 is N mod 105,
  Nmod105 = 0,
  !.
convert(N, "PlangPlong") :-
  Nmod35 is N mod 35,
  Nmod35 = 0,
  !.
convert(N, "PlingPlong") :-
  Nmod21 is N mod 21,
  Nmod21 = 0,
  !.
convert(N, "PlingPlang") :-
  Nmod15 is N mod 15,
  Nmod15 = 0,
  !.
convert(N, "Plong") :-
  Nmod7 is N mod 7,
  Nmod7 = 0,
  !.
convert(N, "Plang") :-
  Nmod5 is N mod 5,
  Nmod5 = 0,
  !.
convert(N, "Pling") :-
  Nmod3 is N mod 3,
  Nmod3 = 0,
  !.
convert(Number, NumberAsString) :-
  number_string(Number, NumberAsString).
