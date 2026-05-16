-module(gnomesort).
-export([gnome_sort/1]).

gnome_sort(List) ->
    Arr = list_to_tuple(List),
    Sorted = gnome_loop(Arr, 0, tuple_size(Arr)),
    tuple_to_list(Sorted).

gnome_loop(Arr, I, N) when I >= N -> Arr;
gnome_loop(Arr, 0, N) -> gnome_loop(Arr, 1, N);
gnome_loop(Arr, I, N) ->
    A = element(I, Arr),
    B = element(I + 1, Arr),
    if B >= A ->
        gnome_loop(Arr, I + 1, N);
    true ->
        Arr2 = setelement(I, setelement(I + 1, Arr, A), B),
        gnome_loop(Arr2, I - 1, N)
    end.
