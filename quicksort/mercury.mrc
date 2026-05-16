:- module mercury.
:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is det.
:- implementation.
:- import_module list, int.

:- pred quicksort(list(int)::in, list(int)::out) is det.
quicksort([], []).
quicksort([Pivot | Rest], Sorted) :-
    list.filter(pred(X::in) is semidet :- X =< Pivot, Rest, Left, Right),
    quicksort(Left, SortedLeft),
    quicksort(Right, SortedRight),
    list.append(SortedLeft, [Pivot | SortedRight], Sorted).

main(!IO) :-
    quicksort([3, 6, 8, 10, 1, 2, 1], Sorted),
    io.write(Sorted, !IO),
    io.nl(!IO).
