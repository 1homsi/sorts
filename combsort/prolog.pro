comb_sort(List, Sorted) :-
    length(List, N),
    list_to_array(List, Arr),
    comb_loop(Arr, N, N, false),
    array_to_list(Arr, Sorted).

comb_loop(Arr, N, Gap, _Sorted) :-
    NewGap is max(1, truncate(Gap / 1.3)),
    (NewGap =:= 1 -> NS = true ; NS = false),
    pass(Arr, N, NewGap, 0, NS, FinalSorted),
    (FinalSorted = true -> true ; comb_loop(Arr, N, NewGap, false)).

pass(_, N, Gap, I, Sorted, Sorted) :- I + Gap >= N, !.
pass(Arr, N, Gap, I, SortedIn, SortedOut) :-
    array_element(Arr, I, A),
    J is I + Gap,
    array_element(Arr, J, B),
    (A > B ->
        set_array_element(Arr, I, B),
        set_array_element(Arr, J, A),
        pass(Arr, N, Gap, I+1, false, SortedOut)
    ;
        pass(Arr, N, Gap, I+1, SortedIn, SortedOut)
    ).
