let rec bogosort lst =
    let isSorted = List.forall2 (<=) (List.take (List.length lst - 1) lst) (List.tail lst)
    if isSorted then lst
    else bogosort (List.sortBy (fun _ -> System.Random().Next()) lst)
