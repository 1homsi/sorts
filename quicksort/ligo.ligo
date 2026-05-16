type list_int is list(int)

function quicksort(const arr: list_int): list_int is
    case arr of
    | nil -> nil
    | cons(pivot, rest) ->
        block {
            const left: list_int = List.filter(function(x: int): bool is x <= pivot, rest);
            const right: list_int = List.filter(function(x: int): bool is x > pivot, rest);
        } with List.concat(quicksort(left), cons(pivot, quicksort(right)))
    end

const main: list_int = quicksort(list[3; 6; 8; 10; 1; 2; 1])
