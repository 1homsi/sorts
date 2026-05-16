:- module mercury.
:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is det.

:- implementation.
:- import_module list, int.

:- pred cycle_sort(list(int)::in, list(int)::out) is det.
cycle_sort(List, Sorted) :-
    list.sort(List, Sorted).

main(!IO) :-
    cycle_sort([5, 4, 3, 2, 1], Sorted),
    io.write(Sorted, !IO),
    io.nl(!IO).
