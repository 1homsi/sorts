-module(erlang).
-export([main/0, bubble_sort/1]).

bubble_pass([], Swapped) -> {[], Swapped};
bubble_pass([X], Swapped) -> {[X], Swapped};
bubble_pass([X, Y | Rest], _Swapped) when X > Y ->
    {Sorted, _} = bubble_pass([X | Rest], true),
    {[Y | Sorted], true};
bubble_pass([X | Rest], Swapped) ->
    {Sorted, S} = bubble_pass(Rest, Swapped),
    {[X | Sorted], S}.

bubble_sort(List) ->
    {Sorted, Swapped} = bubble_pass(List, false),
    case Swapped of
        true -> bubble_sort(Sorted);
        false -> Sorted
    end.

main() ->
    Arr = [64, 34, 25, 12, 22, 11, 90],
    io:format("~p~n", [bubble_sort(Arr)]).
