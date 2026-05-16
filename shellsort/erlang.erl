-module(erlang).
-export([shell_sort/1, main/0]).

shell_sort(List) ->
    Arr = list_to_tuple(List),
    N = tuple_size(Arr),
    Sorted = do_sort(Arr, N, N div 2),
    tuple_to_list(Sorted).

do_sort(Arr, _, 0) -> Arr;
do_sort(Arr, N, Gap) ->
    Arr2 = insertion_pass(Arr, Gap, Gap, N),
    do_sort(Arr2, N, Gap div 2).

insertion_pass(Arr, _, I, N) when I >= N -> Arr;
insertion_pass(Arr, Gap, I, N) ->
    Temp = element(I + 1, Arr),
    Arr2 = shift_back(Arr, Gap, I, Temp),
    insertion_pass(Arr2, Gap, I + 1, N).

shift_back(Arr, Gap, J, Temp) when J < Gap ->
    setelement(J + 1, Arr, Temp);
shift_back(Arr, Gap, J, Temp) ->
    Prev = element(J - Gap + 1, Arr),
    if Prev > Temp ->
        Arr2 = setelement(J + 1, Arr, Prev),
        shift_back(Arr2, Gap, J - Gap, Temp);
    true ->
        setelement(J + 1, Arr, Temp)
    end.

main() ->
    Arr = [64, 34, 25, 12, 22, 11, 90],
    io:format("~w~n", [shell_sort(Arr)]).
