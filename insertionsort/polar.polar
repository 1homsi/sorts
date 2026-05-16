sorted([], []);
sorted([H|T], Sorted) :-
    sorted(T, SortedTail),
    insert(H, SortedTail, Sorted);

insert(X, [], [X]);
insert(X, [H|T], [X, H|T]) :-
    X <= H;
insert(X, [H|T], [H|Sorted]) :-
    X > H,
    insert(X, T, Sorted);
