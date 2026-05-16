:- object(selection_sort).
    :- public(sort/2).
    sort([], []).
    sort(List, [Min|Sorted]) :-
        min_member(Min, List),
        select(Min, List, Rest),
        sort(Rest, Sorted).
:- end_object.
