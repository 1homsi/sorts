:- module mercury.
:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is det.
:- implementation.
:- import_module list, int.

:- pred insert_sorted(int::in, list(int)::in, list(int)::out) is det.
insert_sorted(X, [], [X]).
insert_sorted(X, [H|T], Result) :-
    ( X =< H -> Result = [X, H | T]
    ; insert_sorted(X, T, T1), Result = [H | T1] ).

:- pred insertion_sort(list(int)::in, list(int)::out) is det.
insertion_sort([], []).
insertion_sort([H|T], Sorted) :-
    insertion_sort(T, ST),
    insert_sorted(H, ST, Sorted).

:- pred merge_runs(list(int)::in, list(int)::in, list(int)::out) is det.
merge_runs([], Ys, Ys).
merge_runs(Xs, [], Xs).
merge_runs([X|Xs], [Y|Ys], Result) :-
    ( X =< Y -> merge_runs(Xs, [Y|Ys], Rest), Result = [X|Rest]
    ; merge_runs([X|Xs], Ys, Rest), Result = [Y|Rest] ).

:- pred chunks_of(int::in, list(int)::in, list(list(int))::out) is det.
chunks_of(_, [], []).
chunks_of(N, Xs, [Chunk|Rest]) :-
    list.take_upto(N, Xs, Chunk),
    list.length(Chunk, Len),
    list.drop_upto(Len, Xs, Remaining),
    chunks_of(N, Remaining, Rest).

:- pred merge_pairs(list(list(int))::in, list(list(int))::out) is det.
merge_pairs([], []).
merge_pairs([X], [X]).
merge_pairs([X, Y | Rest], [M | MR]) :-
    merge_runs(X, Y, M),
    merge_pairs(Rest, MR).

:- pred merge_all(list(list(int))::in, list(int)::out) is det.
merge_all([X], X).
merge_all(Runs, Sorted) :-
    Runs = [_,_|_],
    merge_pairs(Runs, Merged),
    merge_all(Merged, Sorted).

:- pred timsort(list(int)::in, list(int)::out) is det.
timsort([], []).
timsort(Xs, Sorted) :-
    Xs = [_|_],
    chunks_of(32, Xs, Chunks),
    list.map(insertion_sort, Chunks, SortedChunks),
    merge_all(SortedChunks, Sorted).

main(!IO) :-
    timsort([5, 2, 8, 1, 9, 3, 7, 4, 6], Sorted),
    io.write(Sorted, !IO),
    io.nl(!IO).
