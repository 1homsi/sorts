let rec quicksort = (lst) =>
  switch (lst) {
  | [] => []
  | [pivot, ...rest] =>
    let left = List.filter((x) => x <= pivot, rest);
    let right = List.filter((x) => x > pivot, rest);
    List.concat([quicksort(left), [pivot], quicksort(right)]);
  };

let () = {
  let sorted = quicksort([3, 6, 8, 10, 1, 2, 1]);
  List.iter((x) => Printf.printf("%d ", x), sorted);
  print_newline();
};
