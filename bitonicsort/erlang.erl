-module(erlang).
-export([main/0, bitonic_sort/2]).

compare_and_swap(A, B, true) when A > B -> {B, A};
compare_and_swap(A, B, false) when A < B -> {B, A};
compare_and_swap(A, B, _) -> {A, B}.

bitonic_merge([], _) -> [];
bitonic_merge([X], _) -> [X];
bitonic_merge(Xs, Dir) ->
    N = length(Xs),
    K = N div 2,
    Left = lists:sublist(Xs, K),
    Right = lists:nthtail(K, Xs),
    Paired = lists:zipwith(fun(A, B) -> compare_and_swap(A, B, Dir) end, Left, Right),
    NewLeft = [element(1, P) || P <- Paired],
    NewRight = [element(2, P) || P <- Paired],
    bitonic_merge(NewLeft, Dir) ++ bitonic_merge(NewRight, Dir).

bitonic_sort([], _) -> [];
bitonic_sort([X], _) -> [X];
bitonic_sort(Xs, Dir) ->
    N = length(Xs),
    K = N div 2,
    Left = lists:sublist(Xs, K),
    Right = lists:nthtail(K, Xs),
    SortedLeft = bitonic_sort(Left, true),
    SortedRight = bitonic_sort(Right, false),
    bitonic_merge(SortedLeft ++ SortedRight, Dir).

main() ->
    Data = [3, 7, 4, 8, 6, 2, 1, 5],
    Sorted = bitonic_sort(Data, true),
    io:format("~p~n", [Sorted]).
