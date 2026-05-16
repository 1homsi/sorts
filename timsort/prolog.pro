:- use_module(library(lists)).

min_run(32).

insertion_sort([], []).
insertion_sort([H|T], Sorted) :-
    insertion_sort(T, SortedT),
    insert(H, SortedT, Sorted).

insert(X, [], [X]).
insert(X, [H|T], [X,H|T]) :- X =< H, !.
insert(X, [H|T], [H|Rest]) :- insert(X, T, Rest).

merge_runs([], Ys, Ys).
merge_runs(Xs, [], Xs).
merge_runs([X|Xs], [Y|Ys], [X|Merged]) :-
    X =< Y, !,
    merge_runs(Xs, [Y|Ys], Merged).
merge_runs([X|Xs], [Y|Ys], [Y|Merged]) :-
    merge_runs([X|Xs], Ys, Merged).

chunks(_, [], []).
chunks(N, Xs, [Chunk|Rest]) :-
    length(Xs, Len),
    ChunkSize is min(N, Len),
    length(Chunk, ChunkSize),
    append(Chunk, Remaining, Xs),
    chunks(N, Remaining, Rest).

merge_pairs([], []).
merge_pairs([X], [X]).
merge_pairs([X,Y|Rest], [Merged|MergedRest]) :-
    merge_runs(X, Y, Merged),
    merge_pairs(Rest, MergedRest).

merge_all([X], X).
merge_all(Runs, Sorted) :-
    merge_pairs(Runs, Merged),
    merge_all(Merged, Sorted).

timsort([], []).
timsort(Xs, Sorted) :-
    min_run(R),
    chunks(R, Xs, Chunks),
    maplist(insertion_sort, Chunks, SortedChunks),
    merge_all(SortedChunks, Sorted).

:- timsort([5,2,8,1,9,3,7,4,6], S), write(S), nl.
