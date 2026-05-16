-module(cocktailsort).
-export([sort/1]).

sort(List) ->
    Arr = list_to_tuple(List),
    N = tuple_size(Arr),
    Sorted = cocktail(Arr, true, 0, N - 1),
    tuple_to_list(Sorted).

cocktail(Arr, false, _, _) -> Arr;
cocktail(Arr, true, Start, End) ->
    {Arr1, Sw1} = forward(Arr, Start, End, false),
    case Sw1 of
        false -> Arr1;
        true ->
            {Arr2, Sw2} = backward(Arr1, Start, End - 2, false),
            cocktail(Arr2, Sw2, Start + 1, End - 1)
    end.

forward(Arr, I, End, Sw) when I >= End -> {Arr, Sw};
forward(Arr, I, End, Sw) ->
    A = element(I + 1, Arr),
    B = element(I + 2, Arr),
    if A > B ->
        Arr1 = setelement(I + 1, setelement(I + 2, Arr, A), B),
        forward(Arr1, I + 1, End, true);
    true ->
        forward(Arr, I + 1, End, Sw)
    end.

backward(Arr, Start, I, Sw) when I < Start -> {Arr, Sw};
backward(Arr, Start, I, Sw) ->
    A = element(I + 1, Arr),
    B = element(I + 2, Arr),
    if A > B ->
        Arr1 = setelement(I + 1, setelement(I + 2, Arr, A), B),
        backward(Arr1, Start, I - 1, true);
    true ->
        backward(Arr, Start, I - 1, Sw)
    end.
