:- object(merge_sort).

:- public(sort/2).
:- public(merge/3).

sort([], []).
sort([X], [X]).
sort(List, Sorted) :-
    List = [_,_|_],
    length(List, Len),
    Mid is Len // 2,
    length(Left, Mid),
    append(Left, Right, List),
    sort(Left, SortedLeft),
    sort(Right, SortedRight),
    merge(SortedLeft, SortedRight, Sorted).

merge([], Right, Right).
merge(Left, [], Left).
merge([Lh|Lt], [Rh|Rt], [Lh|Rest]) :-
    Lh =< Rh, !,
    merge(Lt, [Rh|Rt], Rest).
merge([Lh|Lt], [Rh|Rt], [Rh|Rest]) :-
    merge([Lh|Lt], Rt, Rest).

:- end_object.

:- initialization(
    merge_sort::sort([38,27,43,3,9,82,10], Sorted),
    write(Sorted), nl
).
