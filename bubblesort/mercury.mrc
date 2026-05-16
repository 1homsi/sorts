:- module mercury.
:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is det.

:- implementation.
:- import_module list, int.

:- pred bubble_pass(list(int)::in, list(int)::out, bool::out) is det.
bubble_pass([], [], no).
bubble_pass([X], [X], no).
bubble_pass([X, Y | Rest], Sorted, Swapped) :-
    ( X > Y ->
        bubble_pass([X | Rest], Sorted0, _),
        Sorted = [Y | Sorted0],
        Swapped = yes
    ;
        bubble_pass([Y | Rest], Sorted0, SW),
        Sorted = [X | Sorted0],
        Swapped = SW
    ).

:- pred bubble_sort(list(int)::in, list(int)::out) is det.
bubble_sort(List, Sorted) :-
    bubble_pass(List, Sorted0, Swapped),
    ( Swapped = yes -> bubble_sort(Sorted0, Sorted) ; Sorted = Sorted0 ).

main(!IO) :-
    bubble_sort([64, 34, 25, 12, 22, 11, 90], Sorted),
    io.write(Sorted, !IO),
    io.nl(!IO).
