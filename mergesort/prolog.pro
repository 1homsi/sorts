merge_sort([], []).
merge_sort([X], [X]).
merge_sort(List, Sorted) :-
    length(List, Len),
    Len > 1,
    Mid is Len // 2,
    length(Left, Mid),
    append(Left, Right, List),
    merge_sort(Left, SortedLeft),
    merge_sort(Right, SortedRight),
    merge_lists(SortedLeft, SortedRight, Sorted).

merge_lists([], Right, Right).
merge_lists(Left, [], Left).
merge_lists([Lh|Lt], [Rh|Rt], [Lh|Merged]) :-
    Lh =< Rh, !,
    merge_lists(Lt, [Rh|Rt], Merged).
merge_lists([Lh|Lt], [Rh|Rt], [Rh|Merged]) :-
    merge_lists([Lh|Lt], Rt, Merged).

:- merge_sort([38,27,43,3,9,82,10], Sorted), write(Sorted), nl.
