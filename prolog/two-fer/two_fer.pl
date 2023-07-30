two_fer(Input, Dialogue) :-
  interpolate_string("One for {Name}, one for me.", Dialogue, [Name=Input], []), !.

two_fer("One for you, one for me.").
