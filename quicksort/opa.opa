quicksort(lst: list(int)): list(int) =
  match lst with
  | [] -> []
  | [pivot | rest] ->
    left = List.filter((x -> x <= pivot), rest)
    right = List.filter((x -> x > pivot), rest)
    List.append(quicksort(left), [pivot | quicksort(right)])

result = quicksort([3, 6, 8, 10, 1, 2, 1])
do Log.notice("quicksort", "{result}")
server = one_page_server("Quicksort", -> <pre>{String.of_list(Int.to_string, ", ", result)}</pre>)
