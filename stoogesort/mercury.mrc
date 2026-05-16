:- module mercury.
:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is det.
:- implementation.
:- import_module array, int, list.

:- pred stooge_sort(array(int)::array_di, int::in, int::in, array(int)::array_uo) is det.
stooge_sort(!.Arr, First, Last, !:Arr) :-
    array.lookup(!.Arr, First, A),
    array.lookup(!.Arr, Last, B),
    ( A > B ->
        array.set(First, B, !Arr),
        array.set(Last, A, !Arr)
    ; true ),
    N = Last - First + 1,
    ( N > 2 ->
        T = N * 2 // 3,
        stooge_sort(!.Arr, First, First + T - 1, !:Arr),
        stooge_sort(!.Arr, Last - T + 1, Last, !:Arr),
        stooge_sort(!.Arr, First, First + T - 1, !:Arr)
    ; true ).

main(!IO) :-
    array.from_list([3, 1, 4, 1, 5, 9, 2, 6], Arr0),
    array.size(Arr0, N),
    stooge_sort(Arr0, 0, N - 1, Arr),
    array.to_list(Arr, List),
    io.write_list(List, " ", io.write_int, !IO),
    io.nl(!IO).
