:- object(gnome_sort).
    :- public(sort/2).

    sort(List, Sorted) :-
        list::to_array(List, Arr),
        length(List, N),
        gnome_loop(Arr, 0, N),
        array::to_list(Arr, Sorted).

    gnome_loop(_, I, N) :- I >= N, !.
    gnome_loop(Arr, 0, N) :- !, gnome_loop(Arr, 1, N).
    gnome_loop(Arr, I, N) :-
        I1 is I - 1,
        array::get(Arr, I, Ai),
        array::get(Arr, I1, Ai1),
        (Ai >= Ai1 ->
            I2 is I + 1,
            gnome_loop(Arr, I2, N)
        ;
            array::set(Arr, I, Ai1),
            array::set(Arr, I1, Ai),
            I2 is I - 1,
            gnome_loop(Arr, I2, N)
        ).
:- end_object.
