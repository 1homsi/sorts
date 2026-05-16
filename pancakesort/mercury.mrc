:- module pancake_sort.
:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is det.

:- implementation.
:- import_module list, int, array.

:- pred flip(array(int)::array_di, int::in, array(int)::array_uo) is det.
flip(!.Arr, K, !:Arr) :-
    flip_loop(!.Arr, 0, K, !:Arr).

:- pred flip_loop(array(int)::array_di, int::in, int::in, array(int)::array_uo) is det.
flip_loop(!.Arr, Left, Right, !:Arr) :-
    ( Left < Right ->
        array.lookup(!.Arr, Left, VL),
        array.lookup(!.Arr, Right, VR),
        array.set(Left, VR, !Arr),
        array.set(Right, VL, !Arr),
        flip_loop(!.Arr, Left + 1, Right - 1, !:Arr)
    ;
        !:Arr = !.Arr
    ).

:- pred pancake_sort(array(int)::array_di, array(int)::array_uo) is det.
pancake_sort(!.Arr, !:Arr) :-
    array.size(!.Arr, N),
    sort_step(!.Arr, N, !:Arr).

:- pred sort_step(array(int)::array_di, int::in, array(int)::array_uo) is det.
sort_step(!.Arr, Size, !:Arr) :-
    ( Size =< 1 ->
        !:Arr = !.Arr
    ;
        find_max_idx(!.Arr, Size, 0, 1, MaxIdx),
        ( MaxIdx \= Size - 1 ->
            ( MaxIdx \= 0 -> flip(!.Arr, MaxIdx, !:Arr) ; !:Arr = !.Arr ),
            flip(!.Arr, Size - 1, !:Arr)
        ;
            !:Arr = !.Arr
        ),
        sort_step(!.Arr, Size - 1, !:Arr)
    ).

:- pred find_max_idx(array(int)::in, int::in, int::in, int::in, int::out) is det.
find_max_idx(Arr, Size, MaxIdx, I, Result) :-
    ( I >= Size ->
        Result = MaxIdx
    ;
        array.lookup(Arr, I, VI),
        array.lookup(Arr, MaxIdx, VM),
        ( VI > VM -> NewMax = I ; NewMax = MaxIdx ),
        find_max_idx(Arr, Size, NewMax, I + 1, Result)
    ).

main(!IO) :-
    array.from_list([3, 6, 2, 7, 4, 1, 5], Arr0),
    pancake_sort(Arr0, Sorted),
    io.write(Sorted, !IO),
    io.nl(!IO).
