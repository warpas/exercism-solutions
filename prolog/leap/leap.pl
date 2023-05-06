leap(Year) :-
  DivisibleBy4 is Year mod 4,
  DivisibleBy4 = 0,
  DivisibleBy100 is Year mod 100,
  DivisibleBy100 \= 0,
  !.

leap(Year) :-
  DivisibleBy400 is Year mod 400,
  DivisibleBy400 = 0,
  !.
