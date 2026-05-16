-module(mergesort).
-export([mergesort/1, merge/2]).

mergesort([]) -> [];
mergesort([X]) -> [X];
mergesort(List) ->
    Mid = length(List) div 2,
    Left = lists:sublist(List, Mid),
    Right = lists:nthtail(Mid, List),
    merge(mergesort(Left), mergesort(Right)).

merge([], Right) -> Right;
merge(Left, []) -> Left;
merge([Lh|Lt], [Rh|Rt]) when Lh =< Rh ->
    [Lh | merge(Lt, [Rh|Rt])];
merge([Lh|Lt], [Rh|Rt]) ->
    [Rh | merge([Lh|Lt], Rt)].
