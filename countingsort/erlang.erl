-module(counting_sort).
-export([sort/1, main/0]).

sort([]) -> [];
sort(Arr) ->
    Max = lists:max(Arr),
    Min = lists:min(Arr),
    Range = Max - Min + 1,
    Count0 = array:new(Range, {default, 0}),
    Count1 = lists:foldl(fun(X, Acc) ->
        I = X - Min,
        array:set(I, array:get(I, Acc) + 1, Acc)
    end, Count0, Arr),
    Count2 = lists:foldl(fun(I, Acc) ->
        array:set(I, array:get(I, Acc) + array:get(I-1, Acc), Acc)
    end, Count1, lists:seq(1, Range - 1)),
    Output0 = array:new(length(Arr), {default, 0}),
    {Output, _} = lists:foldr(fun(X, {Out, Cnt}) ->
        I = X - Min,
        Pos = array:get(I, Cnt) - 1,
        {array:set(Pos, X, Out), array:set(I, Pos, Cnt)}
    end, {Output0, Count2}, Arr),
    array:to_list(Output).

main() ->
    io:format("~p~n", [sort([4, 2, 2, 8, 3, 3, 1])]).
