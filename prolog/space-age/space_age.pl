space_age("Earth", AgeSec, Years) :-
  Years is AgeSec / 31_557_600.
space_age("Mercury", AgeSec, Years) :-
  Years is AgeSec / (31_557_600 * 0.2408467).
space_age("Venus", AgeSec, Years) :-
  Years is AgeSec / (31_557_600 * 0.61519726).
space_age("Mars", AgeSec, Years) :-
  Years is AgeSec / (31_557_600 * 1.8808158).
space_age("Jupiter", AgeSec, Years) :-
  Years is AgeSec / (31_557_600 * 11.862615).
space_age("Saturn", AgeSec, Years) :-
  Years is AgeSec / (31_557_600 * 29.447498).
space_age("Uranus", AgeSec, Years) :-
  Years is AgeSec / (31_557_600 * 84.016846).
space_age("Neptune", AgeSec, Years) :-
  Years is AgeSec / (31_557_600 * 164.79132).
