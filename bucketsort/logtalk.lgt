:- object(bucket_sort).

    :- public(sort/2).

    :- meta_predicate(sort(+, -)).

    sort([], []).
    sort(Arr, Sorted) :-
        Arr \= [],
        length(Arr, N),
        min_list(Arr, MinV),
        max_list(Arr, MaxV),
        numlist(0, N1, Indices),
        N1 is N - 1,
        maplist(get_bucket(Arr, MinV, MaxV, N), Indices, Buckets),
        maplist(insertion_sort, Buckets, SortedBuckets),
        flatten(SortedBuckets, Sorted).

    get_bucket(Arr, MinV, MaxV, N, I, Bucket) :-
        include(has_idx(MinV, MaxV, N, I), Arr, Bucket).

    has_idx(MinV, MaxV, N, I, X) :-
        Raw is truncate((X - MinV) / (MaxV - MinV + 1) * N),
        Idx is min(N - 1, Raw),
        Idx =:= I.

    insertion_sort([], []).
    insertion_sort([H|T], Sorted) :-
        insertion_sort(T, SortedT),
        insert_sorted(H, SortedT, Sorted).

    insert_sorted(X, [], [X]).
    insert_sorted(X, [H|T], [X,H|T]) :- X =< H, !.
    insert_sorted(X, [H|T], [H|R]) :- insert_sorted(X, T, R).

:- end_object.

:- initialization((
    bucket_sort::sort([0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68], Sorted),
    write(Sorted), nl
)).
