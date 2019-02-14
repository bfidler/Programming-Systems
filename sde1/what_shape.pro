/*Sde1*/

/*Predicates that parse string lists for "u", "r", "d", and "l".
  Length included as an argument.*/

uA(1, ["u"|Leftover], Leftover).
uA(Length, ["u"|T], Leftover) :-
  uA(L, T, Leftover),
  Length is L + 1.

rA(1, ["r"|Leftover], Leftover).
rA(Length, ["r"|T], Leftover) :-
  rA(L, T, Leftover),
  Length is L + 1.

dA(1, ["d"|Leftover], Leftover).
dA(Length, ["d"|T], Leftover) :-
  dA(L, T, Leftover),
  Length is L + 1.

lA(1, ["l"|Leftover], Leftover).
lA(Length, ["l"|T], Leftover) :-
  lA(L, T, Leftover),
  Length is L + 1.

/*Predicates that parse string lists for "u", "r", "d", and "l".
  Length NOT included as an argument.*/

u(["u"|Leftover], Leftover).
u(["u"|T], Leftover) :- u(T, Leftover).

r(["r"|Leftover], Leftover).
r(["r"|T], Leftover) :- r(T, Leftover).

d(["d"|Leftover], Leftover).
d(["d"|T], Leftover) :- d(T, Leftover).

l(["l"|Leftover], Leftover).
l(["l"|T], Leftover) :- l(T, Leftover).

/*Square Predicates.
  sq ignores side Length.
  sqA requires equal side lengths.*/

sq(In, Leftover) :-
  u(In, R),
  r(R, D),
  d(D, L),
  l(L, Leftover).

sqA(In, Leftover) :-
  uA(Length, In, R),
  rA(Length, R, D),
  dA(Length, D, L),
  lA(Length, L, Leftover).

/*Rectangle Predicate - requires matching parallel sides.*/

rctA(In, Leftover) :-
  uA(X, In, R),
  rA(Y, R, D),
  dA(X, D, L),
  lA(Y, L, Leftover).

/*Generate Rectangle Predicate.
  A is height.
  B is width.*/

grect(A, B, C) :-
  uA(A, C, R),
  rA(B, R, D),
  dA(A, D, L),
  lA(B, L, []).

/*Diagonal Predicates have same functionality as uA, etc.*/

m30A(1, ["m30"|Leftover], Leftover).
m30A(Length, ["m30"|T], Leftover) :-
  m30A(L, T, Leftover),
  Length is L + 1.

p240A(Length, ["p240"|T], Leftover) :-
  p240A(L, T, Leftover),
  Length is L + 1.

/*Equilateral Triangle Predicate - all sides matching length.*/

eqtriA(In, Leftover) :-
  uA(L, In, M30),
  m30A(L, M30, P240),
  p240A(L, P240, Leftover).

/*One shift Predicate - shifts lifts one char to the left*/

one_shift([H|T], R) :- append(T, [H], R).

/*All Shifts Predicate - every shift of A except itself.*/

all_shifts(A, [], L, L) :- length(A, L), L > 0.
all_shifts(A, [A1|T], L, S) :- one_shift(A, A1), S1 is S+1, all_shifts(A1, T, L, S1).

/*Start Shifts Predicate - shows all shifts of the List.*/

start_shifts(List, AS) :- length(List, Len), all_shifts(List, AS, Len, 1).

/*All Cases Predicate - all shifts plus the list.*/

all_cases(A, R) :- start_shifts(A, Shifts), append(Shifts, [A], R).
