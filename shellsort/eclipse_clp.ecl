shellsort([], []).
shellsort(List, Sorted) :-
  length(List, N),
  shellsort_gap(List, 1, N, Gap),
  shellsort_loop(List, Gap, N, Sorted).
shellsort_gap(_, G, N, G) :- G > N, !.
shellsort_gap(_, G, N, R) :-
  G2 is G * 3 + 1,
  shellsort_gap([], G2, N, R).
shellsort_loop(L, G, _, L) :- G =:= 0, !.
shellsort_loop(L, G, N, R) :-
  G2 is G // 3,
  shellsort_loop(L, G2, N, R).
?- shellsort([5, 2, 8, 1, 9, 3], X), write(X).
