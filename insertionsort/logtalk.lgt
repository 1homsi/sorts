:- object(insertion_sort).

:- public(sort/2).

sort([], []).
sort([H|T], Sorted) :-
    sort(T, SortedT),
    insert(H, SortedT, Sorted).

:- private(insert/3).

insert(X, [], [X]).
insert(X, [H|T], [X,H|T]) :- X =< H.
insert(X, [H|T], [H|R]) :- X > H, insert(X, T, R).

:- end_object.
