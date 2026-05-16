selection_sort([], []).
selection_sort(List, [Min|Sorted]) :-
    min_member(Min, List),
    select(Min, List, Rest),
    selection_sort(Rest, Sorted).
