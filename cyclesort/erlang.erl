-module(erlang).
-export([cycle_sort/1, main/0]).

cycle_sort(List) ->
    Arr = array:from_list(List),
    N = array:size(Arr),
    Arr2 = do_sort(Arr, N, 0),
    array:to_list(Arr2).

do_sort(Arr, N, CycleStart) when CycleStart >= N - 1 -> Arr;
do_sort(Arr, N, CycleStart) ->
    Item = array:get(CycleStart, Arr),
    Pos = count_smaller(Arr, N, CycleStart + 1, Item, CycleStart),
    if
        Pos =:= CycleStart ->
            do_sort(Arr, N, CycleStart + 1);
        true ->
            Pos2 = skip_dups(Arr, Pos, Item),
            Val = array:get(Pos2, Arr),
            Arr2 = array:set(Pos2, Item, Arr),
            {Arr3, _} = do_cycle(Arr2, N, CycleStart, Val, Pos2),
            do_sort(Arr3, N, CycleStart + 1)
    end.

count_smaller(_Arr, N, I, _Item, Pos) when I >= N -> Pos;
count_smaller(Arr, N, I, Item, Pos) ->
    V = array:get(I, Arr),
    NewPos = if V < Item -> Pos + 1; true -> Pos end,
    count_smaller(Arr, N, I + 1, Item, NewPos).

skip_dups(Arr, Pos, Item) ->
    V = array:get(Pos, Arr),
    if V =:= Item -> skip_dups(Arr, Pos + 1, Item); true -> Pos end.

do_cycle(Arr, N, CycleStart, Item, Pos) when Pos =:= CycleStart -> {Arr, Item};
do_cycle(Arr, N, CycleStart, Item, _Pos) ->
    Pos2 = count_smaller(Arr, N, CycleStart + 1, Item, CycleStart),
    Pos3 = skip_dups(Arr, Pos2, Item),
    Val = array:get(Pos3, Arr),
    Arr2 = array:set(Pos3, Item, Arr),
    do_cycle(Arr2, N, CycleStart, Val, Pos3).

main() ->
    Sorted = cycle_sort([5, 4, 3, 2, 1]),
    io:format("~p~n", [Sorted]).
