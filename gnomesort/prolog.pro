gnome_sort(List, Sorted) :-
    list_to_array(List, Arr),
    length(List, N),
    gnome_loop(Arr, 0, N),
    array_to_list(Arr, Sorted).

gnome_loop(_, I, N) :- I >= N, !.
gnome_loop(Arr, 0, N) :- !, gnome_loop(Arr, 1, N).
gnome_loop(Arr, I, N) :-
    I1 is I - 1,
    array_get(Arr, I, A),
    array_get(Arr, I1, B),
    (A >= B ->
        I2 is I + 1,
        gnome_loop(Arr, I2, N)
    ;
        array_set(Arr, I, B),
        array_set(Arr, I1, A),
        I2 is I - 1,
        gnome_loop(Arr, I2, N)
    ).
