-module(erlang).
-export([main/0, stooge_sort/3]).

stooge_sort(Arr, First, Last) ->
    A = array:get(First, Arr),
    B = array:get(Last, Arr),
    Arr1 = if A > B ->
        array:set(First, B, array:set(Last, A, Arr));
    true -> Arr
    end,
    N = Last - First + 1,
    if N > 2 ->
        T = N * 2 div 3,
        Arr2 = stooge_sort(Arr1, First, First + T - 1),
        Arr3 = stooge_sort(Arr2, Last - T + 1, Last),
        stooge_sort(Arr3, First, First + T - 1);
    true -> Arr1
    end.

main() ->
    List = [3, 1, 4, 1, 5, 9, 2, 6],
    Arr = array:from_list(List),
    Sorted = stooge_sort(Arr, 0, length(List) - 1),
    io:format("~p~n", [array:to_list(Sorted)]).
