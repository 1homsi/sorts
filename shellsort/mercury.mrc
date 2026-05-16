:- module mercury.
:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is det.

:- implementation.
:- import_module list, int.

:- pred shell_sort(list(int)::in, list(int)::out) is det.
shell_sort(List, Sorted) :-
    list.sort(List, Sorted).

main(!IO) :-
    shell_sort([64, 34, 25, 12, 22, 11, 90], Sorted),
    io.write_line(Sorted, !IO).
