:- object(pancake_sort).

    :- public(sort/2).

    sort(List, Sorted) :-
        length(List, N),
        list_to_array(List, Arr),
        sort_step(Arr, N),
        array_to_list(Arr, Sorted).

    sort_step(_, 1) :- !.
    sort_step(Arr, Size) :-
        find_max_idx(Arr, Size, MaxIdx),
        ( MaxIdx =\= Size - 1 ->
            ( MaxIdx =\= 0 -> flip(Arr, MaxIdx) ; true ),
            flip(Arr, Size - 1)
        ; true
        ),
        Size1 is Size - 1,
        sort_step(Arr, Size1).

    flip(Arr, K) :- flip_loop(Arr, 0, K).

    flip_loop(_, L, R) :- L >= R, !.
    flip_loop(Arr, L, R) :-
        array_get(Arr, L, VL),
        array_get(Arr, R, VR),
        array_set(Arr, L, VR),
        array_set(Arr, R, VL),
        L1 is L + 1, R1 is R - 1,
        flip_loop(Arr, L1, R1).

    find_max_idx(Arr, Size, MaxIdx) :-
        find_max_loop(Arr, Size, 0, 1, MaxIdx).

    find_max_loop(_, Size, Mi, I, Mi) :- I >= Size, !.
    find_max_loop(Arr, Size, Mi, I, Result) :-
        array_get(Arr, I, VI), array_get(Arr, Mi, VM),
        ( VI > VM -> NMi = I ; NMi = Mi ),
        I1 is I + 1,
        find_max_loop(Arr, Size, NMi, I1, Result).

:- end_object.

:- initialization(
    pancake_sort::sort([3,6,2,7,4,1,5], S), write(S), nl
).
