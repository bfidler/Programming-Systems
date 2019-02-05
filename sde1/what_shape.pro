/*Sde1*/


isU("u").
isR("r").
isD("d").
isL("l").

uA(0, [], []).

rA(0, [], []).

dA(0, [], []).

dA(0, [], []).

uA(Length, [H|T], Leftover) :- isU(H),
  uA(L, T, Leftover),
  Length is L + 1.

rA(Length, [H|T], Leftover) :- isR(H),
  rA(L, T, Leftover),
  Length is L + 1.

dA(Length, [H|T], Leftover) :- isD(H),
  dA(L, T, Leftover),
  Length is L + 1.

lA(Length, [H|T], Leftover) :- isL(H),
  lA(L, T, Leftover),
  Length is L + 1.
