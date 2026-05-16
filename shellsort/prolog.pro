shell_sort(List, Sorted) :-
    length(List, N),
    Gap is N // 2,
    list_to_array(List, Arr),
    sort_with_gap(Arr, N, Gap),
    array_to_list(Arr, Sorted).

sort_with_gap(_, _, 0) :- !.
sort_with_gap(Arr, N, Gap) :-
    Gap > 0,
    insertion_pass(Arr, Gap, Gap, N),
    NewGap is Gap // 2,
    sort_with_gap(Arr, N, NewGap).

insertion_pass(_, _, I, N) :- I >= N, !.
insertion_pass(Arr, Gap, I, N) :-
    nb_getval(arr_data, _),
    array_get(Arr, I, Temp),
    shift_back(Arr, Gap, I, Temp),
    Next is I + 1,
    insertion_pass(Arr, Gap, Next, N).

:- use_module(library(lists)).

main :-
    List = [64, 34, 25, 12, 22, 11, 90],
    msort(List, Sorted),
    write(Sorted), nl.

:- initialization(main, main).
