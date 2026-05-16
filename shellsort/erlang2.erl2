shellsort(List) ->
    N = length(List),
    Gap = N div 2,
    shell_sort(Gap, List, N).

shell_sort(Gap, List, _) when Gap =< 0 ->
    List;
shell_sort(Gap, List, N) ->
    NewList = insert_gap(List, Gap, Gap, N),
    shell_sort(Gap div 2, NewList, N).

insert_gap(List, _, Idx, N) when Idx >= N ->
    List;
insert_gap(List, Gap, Idx, N) ->
    Element = lists:nth(Idx + 1, List),
    if Idx < Gap ->
        insert_gap(List, Gap, Idx + 1, N);
    true ->
        CompIdx = Idx - Gap + 1,
        CompElement = lists:nth(CompIdx, List),
        if CompElement > Element ->
            Swapped = swap_elements(List, CompIdx - 1, Idx),
            insert_gap(Swapped, Gap, Idx + 1, N);
        true ->
            insert_gap(List, Gap, Idx + 1, N)
        end
    end.

swap_elements(List, I, J) ->
    lists:sublist(List, I - 1) ++ [lists:nth(J + 1, List)] ++ lists:sublist(List, I, J - I) ++ [lists:nth(I + 1, List)] ++ lists:sublist(List, J + 2).
