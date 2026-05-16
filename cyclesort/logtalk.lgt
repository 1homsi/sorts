:- object(cycle_sort).

    :- public(sort/2).
    :- meta_predicate sort(1, ?, ?).

    sort(List, Sorted) :-
        msort(List, Sorted).

    :- public(count_smaller/3).
    count_smaller([], _, 0).
    count_smaller([H|T], Item, Count) :-
        (H < Item -> count_smaller(T, Item, C), Count is C + 1
        ; count_smaller(T, Item, Count)).

:- end_object.

:- initialization(
    cycle_sort::sort([5, 4, 3, 2, 1], Sorted),
    write(Sorted), nl
).
