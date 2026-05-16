bucket_sort([], _, []).
bucket_sort([H|T], MaxVal, Result) :-
    bucket_sort(T, MaxVal, RestResult),
    insert_into_sorted(H, RestResult, Result).

insert_into_sorted(X, [], [X]).
insert_into_sorted(X, [H|T], [X, H|T]) :- X =< H.
insert_into_sorted(X, [H|T], [H|Rest]) :-
    X > H,
    insert_into_sorted(X, T, Rest).

:- bucket_sort([5, 2, 8, 1, 9, 3], 10, Sorted),
   write(Sorted), nl.