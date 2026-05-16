shellsort([], []).
shellsort(L, S) :-
  length(L, N),
  shellsort_init_gap(N, G),
  shellsort_loop(L, G, S).

shellsort_init_gap(N, G) :-
  shellsort_gap_loop(1, N, G).

shellsort_gap_loop(G, N, G) :- G > N, !.
shellsort_gap_loop(G, N, R) :-
  G2 is G * 3 + 1,
  shellsort_gap_loop(G2, N, R).

shellsort_loop(L, G, L) :- G =:= 0, !.
shellsort_loop(L, G, R) :-
  G2 is G // 3,
  shellsort_loop(L, G2, R).

?- shellsort([5, 2, 8, 1, 9, 3], X), write(X).
