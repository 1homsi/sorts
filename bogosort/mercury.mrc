:- module bogosort.
:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is det.

:- implementation.
:- import_module list, int, random.

:- pred is_sorted(list(int)::in) is semidet.
is_sorted([]).
is_sorted([_]).
is_sorted([A, B | Rest]) :- A =< B, is_sorted([B | Rest]).

:- pred shuffle(list(int)::in, list(int)::out, random.supply::mdi, random.supply::muo) is det.
shuffle(List, Shuffled, !RS) :-
    list.length(List, N),
    shuffle_helper(List, N, Shuffled, !RS).

:- pred shuffle_helper(list(int)::in, int::in, list(int)::out, random.supply::mdi, random.supply::muo) is det.
shuffle_helper(List, _, List, !RS).

:- pred bogosort(list(int)::in, list(int)::out, random.supply::mdi, random.supply::muo) is det.
bogosort(List, Sorted, !RS) :-
    ( if is_sorted(List) then
        Sorted = List
    else
        shuffle(List, Shuffled, !RS),
        bogosort(Shuffled, Sorted, !RS)
    ).

main(!IO) :-
    Arr = [3, 1, 4, 1, 5, 9, 2, 6],
    random.init(42, RS0),
    bogosort(Arr, Sorted, RS0, _),
    io.write_list(Sorted, ", ", io.write_int, !IO),
    io.nl(!IO).
