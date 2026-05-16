sorted([], []);
sorted([H|T], Sorted) :-
    partition(H, T, Less, Greater),
    sorted(Less, SortedLess),
    sorted(Greater, SortedGreater),
    append(SortedLess, [H|SortedGreater], Sorted).

partition(_, [], [], []).
partition(Pivot, [H|T], [H|Less], Greater) :-
    H =< Pivot,
    partition(Pivot, T, Less, Greater).
partition(Pivot, [H|T], Less, [H|Greater]) :-
    H > Pivot,
    partition(Pivot, T, Less, Greater).

allow(actor, action, resource) if
    sorted([3,6,8,10,1,2,1], _sorted);
