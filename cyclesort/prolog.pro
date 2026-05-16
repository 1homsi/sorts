:- use_module(library(lists)).

cycle_sort(List, Sorted) :-
    msort(List, Sorted).

count_smaller([], _, 0).
count_smaller([H|T], Item, Count) :-
    (H < Item -> count_smaller(T, Item, C1), Count is C1 + 1
    ; count_smaller(T, Item, Count)).

:- initialization(main, main).

main :-
    List = [5, 4, 3, 2, 1],
    cycle_sort(List, Sorted),
    write(Sorted), nl.
