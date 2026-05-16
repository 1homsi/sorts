insertionSort([], []).
insertionSort([H|T], Sorted) :- insertionSort(T, SortedT), insert(H, SortedT, Sorted).

insert(X, [], [X]).
insert(X, [H|T], [X,H|T]) :- X =< H.
insert(X, [H|T], [H|R]) :- X > H, insert(X, T, R).

:- insertionSort([5,2,8,1,9,3], X), write(X), nl.