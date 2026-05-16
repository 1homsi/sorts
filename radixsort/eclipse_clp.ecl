radixsort([], []).
radixsort([H|T], Sorted) :-
  radixsort(T, SortedT),
  insert_sorted(H, SortedT, Sorted).

insert_sorted(X, [], [X]).
insert_sorted(X, [H|T], [X, H|T]) :- X =< H.
insert_sorted(X, [H|T], [H|Sorted]) :- X > H, insert_sorted(X, T, Sorted).

:- radixsort([5, 2, 8, 1, 9, 3], X), write(X), nl.
