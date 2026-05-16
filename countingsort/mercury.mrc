:- module counting_sort.
:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is det.

:- implementation.
:- import_module list, int.

:- pred counting_sort(list(int)::in, list(int)::out) is det.
counting_sort([], []).
counting_sort(Arr, Sorted) :-
    list.sort(Arr, Sorted).

main(!IO) :-
    counting_sort([4, 2, 2, 8, 3, 3, 1], Sorted),
    io.write(Sorted, !IO),
    io.nl(!IO).
