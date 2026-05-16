-module(erlang).
-export([quicksort/1]).

quicksort([]) -> [];
quicksort([Pivot | Rest]) ->
    Left = [X || X <- Rest, X =< Pivot],
    Right = [X || X <- Rest, X > Pivot],
    quicksort(Left) ++ [Pivot] ++ quicksort(Right).
