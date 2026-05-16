bubble_sort([], []).
bubble_sort([X], [X]).
bubble_sort([H|T], Sorted) :-
  bubble_sort(T, SortedT),
  insert_sorted(H, SortedT, Sorted).

insert_sorted(X, [], [X]).
insert_sorted(X, [H|T], [X, H|T]) :- X =< H, !.
insert_sorted(X, [H|T], [H|R]) :- insert_sorted(X, T, R).

?- bubble_sort([5, 2, 8, 1, 9, 3], X), write(X), nl.