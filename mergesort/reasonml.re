let rec merge = (left, right) =>
  switch (left, right) {
  | ([], _) => right
  | (_, []) => left
  | ([lh, ...lt], [rh, ...rt]) =>
    if (lh <= rh) {[lh, ...merge(lt, right)]}
    else {[rh, ...merge(left, rt)]}
  };

let rec mergeSort = lst => {
  let n = List.length(lst);
  if (n <= 1) {
    lst;
  } else {
    let mid = n / 2;
    let left = mergeSort(Belt.List.take(lst, mid) |> Option.value(~default=[]));
    let right = mergeSort(Belt.List.drop(lst, mid) |> Option.value(~default=[]));
    merge(left, right);
  };
};

let result = mergeSort([38, 27, 43, 3, 9, 82, 10]);
List.iter(v => Printf.printf("%d ", v), result);
print_newline();
