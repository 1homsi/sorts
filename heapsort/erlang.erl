-module(erlang).
-export([heapsort/1, main/0]).

heapify(Arr, N, I) ->
    Left = 2 * I + 1,
    Right = 2 * I + 2,
    Largest0 = if Left < N andalso element(Left+1, Arr) > element(I+1, Arr) -> Left; true -> I end,
    Largest = if Right < N andalso element(Right+1, Arr) > element(Largest0+1, Arr) -> Right; true -> Largest0 end,
    if Largest =/= I ->
        Arr1 = setelement(I+1, setelement(Largest+1, Arr, element(I+1, Arr)), element(Largest+1, Arr)),
        heapify(Arr1, N, Largest);
    true -> Arr
    end.

build_heap(Arr, N) ->
    lists:foldl(fun(I, A) -> heapify(A, N, I) end, Arr, lists:seq(N div 2 - 1, 0, -1)).

sort_step(Arr, I) ->
    Arr1 = setelement(1, setelement(I+1, Arr, element(1, Arr)), element(I+1, Arr)),
    heapify(Arr1, I, 0).

heapsort(List) ->
    N = length(List),
    Arr = list_to_tuple(List),
    Heap = build_heap(Arr, N),
    Sorted = lists:foldl(fun(I, A) -> sort_step(A, I) end, Heap, lists:seq(N-1, 1, -1)),
    tuple_to_list(Sorted).

main() ->
    io:format("~p~n", [heapsort([12, 11, 13, 5, 6, 7])]).
