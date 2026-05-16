-module(erlang).
-export([bucket_sort/1, main/0]).

insertion_sort([]) -> [];
insertion_sort([H|T]) -> insert(H, insertion_sort(T)).

insert(X, []) -> [X];
insert(X, [H|T]) when X =< H -> [X, H | T];
insert(X, [H|T]) -> [H | insert(X, T)].

bucket_sort([]) -> [];
bucket_sort(Arr) ->
    N = length(Arr),
    Min = lists:min(Arr),
    Max = lists:max(Arr),
    Buckets = lists:duplicate(N, []),
    BucketsWithData = lists:foldl(fun(X, Bs) ->
        Idx = min(N - 1, trunc((X - Min) / (Max - Min + 1) * N)),
        lists:sublist(Bs, Idx) ++ [lists:nth(Idx + 1, Bs) ++ [X]] ++ lists:nthtail(Idx + 1, Bs)
    end, Buckets, Arr),
    lists:flatten(lists:map(fun insertion_sort/1, BucketsWithData)).

main() ->
    io:format("~p~n", [bucket_sort([0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68])]).
