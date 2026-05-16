:- object(comb_sort).

    :- public(sort/2).

    sort(List, Sorted) :-
        length(List, N),
        list_to_array(List, Arr),
        loop(Arr, N, N),
        array_to_list(Arr, Sorted).

    loop(Arr, N, Gap) :-
        NewGap is max(1, truncate(Gap / 1.3)),
        pass(Arr, N, NewGap, 0, false, Changed),
        (NewGap =:= 1, Changed = false ->
            true
        ;
            loop(Arr, N, NewGap)
        ).

    pass(_, N, Gap, I, Changed, Changed) :-
        I + Gap >= N, !.
    pass(Arr, N, Gap, I, _, Changed) :-
        J is I + Gap,
        array_get(Arr, I, A),
        array_get(Arr, J, B),
        (A > B ->
            array_set(Arr, I, B),
            array_set(Arr, J, A),
            pass(Arr, N, Gap, I+1, true, Changed)
        ;
            pass(Arr, N, Gap, I+1, false, Changed)
        ).

:- end_object.
