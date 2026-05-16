-module(erlang).
-export([radix_sort/1, main/0]).

counting_sort(Arr, Exp) ->
    Buckets = lists:foldl(fun(X, Bs) ->
        Idx = (X div Exp) rem 10,
        setelement(Idx + 1, Bs, element(Idx + 1, Bs) ++ [X])
    end, erlang:make_tuple(10, []), Arr),
    lists:append(tuple_to_list(Buckets)).

radix_sort([]) -> [];
radix_sort(Arr) ->
    Max = lists:max(Arr),
    radix_sort_loop(Arr, Max, 1).

radix_sort_loop(Arr, Max, Exp) when Max div Exp > 0 ->
    radix_sort_loop(counting_sort(Arr, Exp), Max, Exp * 10);
radix_sort_loop(Arr, _, _) -> Arr.

main() ->
    io:format("~p~n", [radix_sort([170, 45, 75, 90, 802, 24, 2, 66])]).
