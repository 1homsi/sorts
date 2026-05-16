:- object(quicksort).

:- public(sort/2).

sort([], []).
sort([Pivot|Rest], Sorted) :-
    partition(Pivot, Rest, Less, Greater),
    sort(Less, SortedLess),
    sort(Greater, SortedGreater),
    append(SortedLess, [Pivot|SortedGreater], Sorted).

partition(_, [], [], []).
partition(Pivot, [H|T], [H|Less], Greater) :-
    H =< Pivot, !,
    partition(Pivot, T, Less, Greater).
partition(Pivot, [H|T], Less, [H|Greater]) :-
    partition(Pivot, T, Less, Greater).

:- end_object.

:- initialization(
    quicksort::sort([3,6,8,10,1,2,1], S),
    write(S), nl
).
