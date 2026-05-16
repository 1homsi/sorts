-module(selectionsort).
-export([selection_sort/1]).

selection_sort([]) -> [];
selection_sort(List) ->
    Min = lists:min(List),
    Rest = lists:delete(Min, List),
    [Min | selection_sort(Rest)].
