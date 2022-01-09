triangle(Side, Side, Side, "equilateral") :- Side > 0.
triangle(Side, Side, Other, "isosceles") :- Sum is Side * 2, Other < Sum.
triangle(Other, Side, Side, "isosceles") :- Sum is Side * 2, Other < Sum.
triangle(Side, Other, Side, "isosceles") :- Sum is Side * 2, Other < Sum.
triangle(Side1, Side2, Side3, "scalene") :-
  Side1 \== Side2,
  Side2 \== Side3,
  Side1 \== Side3,
  Perimiter is Side1 + Side2 + Side3,
  Perimiter > Side1 * 2,
  Perimiter > Side2 * 2,
  Perimiter > Side3 * 2.
