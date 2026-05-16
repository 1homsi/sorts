:- module mercury.
:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is det.

:- implementation.
:- import_module list, int, array.

:- pred heapify(array(int)::array_di, array(int)::array_uo, int::in, int::in) is det.
heapify(!Arr, N, I) :-
    Left = 2 * I + 1,
    Right = 2 * I + 2,
    ( if Left < N, array.lookup(!.Arr, Left) > array.lookup(!.Arr, I) then Largest0 = Left else Largest0 = I ),
    ( if Right < N, array.lookup(!.Arr, Right) > array.lookup(!.Arr, Largest0) then Largest = Right else Largest = Largest0 ),
    ( if Largest \= I then
        array.lookup(!.Arr, I, VI),
        array.lookup(!.Arr, Largest, VL),
        array.set(I, VL, !Arr),
        array.set(Largest, VI, !Arr),
        heapify(!Arr, N, Largest)
    else true ).

main(!IO) :-
    array.from_list([12, 11, 13, 5, 6, 7], Arr0),
    N = array.size(Arr0),
    int.fold_down(heapify_wrap(N), N // 2 - 1, 0, Arr0, Arr1),
    io.write(array.to_list(Arr1), !IO), io.nl(!IO).

:- pred heapify_wrap(int::in, int::in, array(int)::array_di, array(int)::array_uo) is det.
heapify_wrap(N, I, !Arr) :- heapify(!Arr, N, I).
