:- module bitonic_sort.
:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is det.

:- implementation.
:- import_module list, int.

:- pred bitonic_sort(list(int)::in, bool::in, list(int)::out) is det.

bitonic_sort([], _, []).
bitonic_sort([X], _, [X]).
bitonic_sort(Xs, Dir, Sorted) :-
    list.length(Xs, N),
    K = N // 2,
    list.take_upto(K, Xs, Left),
    list.drop_upto(K, Xs, Right),
    bitonic_sort(Left, yes, SortedLeft),
    bitonic_sort(Right, no, SortedRight),
    list.append(SortedLeft, SortedRight, Merged),
    bitonic_merge(Merged, Dir, Sorted).

:- pred bitonic_merge(list(int)::in, bool::in, list(int)::out) is det.
bitonic_merge([], _, []).
bitonic_merge([X], _, [X]).
bitonic_merge(Xs, Dir, Sorted) :-
    list.sort(Xs, S),
    ( Dir = yes -> Sorted = S ; list.reverse(S, Sorted) ).

main(!IO) :-
    Data = [3, 7, 4, 8, 6, 2, 1, 5],
    bitonic_sort(Data, yes, Sorted),
    io.write_list(Sorted, " ", io.write_int, !IO),
    io.nl(!IO).
