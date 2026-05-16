:- module gnome_sort.
:- interface.
:- import_module list.
:- pred gnome_sort(list(int)::in, list(int)::out) is det.
:- implementation.
:- import_module array.

gnome_sort(List, Sorted) :-
    array.from_list(List, Arr0),
    array.size(Arr0, N),
    gnome_loop(Arr0, Arr, 0, N),
    array.to_list(Arr, Sorted).

:- pred gnome_loop(array(int)::in, array(int)::out, int::in, int::in) is det.
gnome_loop(!.A, !:A, I, N) :-
    ( I >= N ->
        true
    ; I = 0 ->
        gnome_loop(!.A, !:A, I + 1, N)
    ;
        array.lookup(!.A, I, Ai),
        array.lookup(!.A, I - 1, Ai1),
        ( Ai >= Ai1 ->
            gnome_loop(!.A, !:A, I + 1, N)
        ;
            array.set(I, Ai1, !A),
            array.set(I - 1, Ai, !A),
            gnome_loop(!.A, !:A, I - 1, N)
        )
    ).
