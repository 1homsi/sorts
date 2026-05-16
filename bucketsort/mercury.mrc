:- module mercury.
:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is det.

:- implementation.
:- import_module list, float, int, math.

:- func insert_sorted(float, list(float)) = list(float).
insert_sorted(X, []) = [X].
insert_sorted(X, [H|T]) = Result :-
    ( X =< H ->
        Result = [X, H | T]
    ;
        Result = [H | insert_sorted(X, T)]
    ).

:- func insertion_sort(list(float)) = list(float).
insertion_sort([]) = [].
insertion_sort([H|T]) = insert_sorted(H, insertion_sort(T)).

:- func get_idx(float, float, float, int) = int.
get_idx(Num, Min, Max, N) = Idx :-
    Raw = truncate_to_int((Num - Min) / (Max - Min + 1.0) * float(N)),
    Idx = min(N - 1, Raw).

:- func fill_buckets(list(float), float, float, int, list(list(float))) = list(list(float)).
fill_buckets([], _, _, _, Bs) = Bs.
fill_buckets([X|Xs], Min, Max, N, Bs) = Result :-
    Idx = get_idx(X, Min, Max, N),
    list.det_index0(Bs, Idx, OldBucket),
    NewBucket = OldBucket ++ [X],
    list.det_replace_nth(Bs, Idx + 1, NewBucket, NewBs),
    Result = fill_buckets(Xs, Min, Max, N, NewBs).

:- func bucket_sort(list(float)) = list(float).
bucket_sort([]) = [].
bucket_sort(Arr) = Result :-
    N = list.length(Arr),
    Min = list.foldl(float.min, Arr, list.det_head(Arr)),
    Max = list.foldl(float.max, Arr, list.det_head(Arr)),
    EmptyBuckets = list.duplicate(N, []),
    Filled = fill_buckets(Arr, Min, Max, N, EmptyBuckets),
    Result = list.condense(list.map(insertion_sort, Filled)).

main(!IO) :-
    Data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68],
    Sorted = bucket_sort(Data),
    io.write(Sorted, !IO),
    io.nl(!IO).
