selection_sort([], []).
selection_sort([H|T], Sorted) :-
    selection_sort(T, SortedT),
    insert_sorted(H, SortedT, Sorted).

insert_sorted(X, [], [X]).
insert_sorted(X, [H|T], [X|[H|T]]) :- X =< H.
insert_sorted(X, [H|T], [H|R]) :- X > H, insert_sorted(X, T, R).

:- initialization(main).
main :-
    selection_sort([5,2,8,1,9,3], R),
    write(R), nl, halt.
