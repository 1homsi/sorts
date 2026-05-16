-module(combsort).
-export([comb_sort/1]).

comb_sort(List) ->
    Arr = list_to_tuple(List),
    N = tuple_size(Arr),
    Sorted = sort_loop(Arr, N, N, false),
    tuple_to_list(Sorted).

sort_loop(Arr, N, Gap, Sorted) ->
    NewGap = max(1, trunc(Gap / 1.3)),
    {NewArr, Changed} = pass(Arr, N, NewGap, 0, false),
    if
        NewGap =:= 1 andalso not Changed ->
            NewArr;
        true ->
            sort_loop(NewArr, N, NewGap, false)
    end.

pass(Arr, N, Gap, I, Changed) when I + Gap >= N ->
    {Arr, Changed};
pass(Arr, N, Gap, I, Changed) ->
    A = element(I+1, Arr),
    B = element(I+Gap+1, Arr),
    if
        A > B ->
            NewArr = setelement(I+1, setelement(I+Gap+1, Arr, A), B),
            pass(NewArr, N, Gap, I+1, true);
        true ->
            pass(Arr, N, Gap, I+1, Changed)
    end.
