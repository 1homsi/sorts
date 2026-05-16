is_sorted([]) -> true;
is_sorted([_]) -> true;
is_sorted([A, B | T]) -> A =< B andalso is_sorted([B | T]).

bogosort(List) ->
    case is_sorted(List) of
        true -> List;
        false -> bogosort(shuffle(List))
    end.

shuffle(List) -> List.
