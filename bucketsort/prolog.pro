:- use_module(library(lists)).

insertion_sort([], []).
insertion_sort([H|T], Sorted) :-
    insertion_sort(T, SortedT),
    insert_sorted(H, SortedT, Sorted).

insert_sorted(X, [], [X]).
insert_sorted(X, [H|T], [X,H|T]) :- X =< H, !.
insert_sorted(X, [H|T], [H|R]) :- insert_sorted(X, T, R).

get_idx(Num, Min, Max, N, Idx) :-
    Raw is truncate((Num - Min) / (Max - Min + 1) * N),
    Idx is min(N - 1, Raw).

fill_buckets([], _, _, _, Buckets, Buckets).
fill_buckets([H|T], Min, Max, N, BIn, BOut) :-
    get_idx(H, Min, Max, N, Idx),
    nth0(Idx, BIn, OldBucket),
    append(OldBucket, [H], NewBucket),
    nth0(Idx, BIn, _, TmpB),
    nth0(Idx, BOut0, NewBucket, TmpB),
    fill_buckets(T, Min, Max, N, BOut0, BOut).

bucket_sort([], []) :- !.
bucket_sort(Arr, Sorted) :-
    length(Arr, N),
    min_list(Arr, Min),
    max_list(Arr, Max),
    length(EmptyBuckets, N),
    maplist(=([]), EmptyBuckets),
    fill_buckets(Arr, Min, Max, N, EmptyBuckets, Buckets),
    maplist(insertion_sort, Buckets, SortedBuckets),
    flatten(SortedBuckets, Sorted).

:- bucket_sort([0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68], S), write(S), nl.
