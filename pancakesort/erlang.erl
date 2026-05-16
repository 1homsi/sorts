-module(erlang).
-export([main/0]).

flip(Arr, K) ->
    {Front, Back} = lists:split(K + 1, Arr),
    lists:reverse(Front) ++ Back.

find_max_idx(Arr, Size) ->
    Sub = lists:sublist(Arr, Size),
    Max = lists:max(Sub),
    Idx = string:str(Sub, [Max]) - 1,
    Idx.

pancake_sort(Arr) -> sort(Arr, length(Arr)).

sort(Arr, 1) -> Arr;
sort(Arr, Size) ->
    MaxIdx = find_max_idx(Arr, Size),
    A1 = if MaxIdx =/= 0 -> flip(Arr, MaxIdx); true -> Arr end,
    A2 = flip(A1, Size - 1),
    sort(A2, Size - 1).

main() ->
    Arr = [3, 6, 2, 7, 4, 1, 5],
    io:format("~p~n", [pancake_sort(Arr)]).
