recursive function selection_sort (lst : list (int)) : list (int) is
  case lst of
  | nil -> nil
  | _ ->
    block {
      const m : int = List.fold_left (fun (acc, x) -> if x < acc then x else acc, List.head_opt (lst) |> Option.unopt, lst);
      const rest : list (int) = List.filter (fun (x) -> x =/= m, lst);
    } with m # selection_sort (rest)
  end
