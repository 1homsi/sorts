let rec quicksort = (lst: list<int>): list<int> =>
  switch lst {
  | list{} => list{}
  | list{pivot, ...rest} =>
    let left = List.filter(x => x <= pivot, rest)
    let right = List.filter(x => x > pivot, rest)
    List.concat(list{quicksort(left), list{pivot}, quicksort(right)})
  }

let () = {
  let sorted = quicksort(list{3, 6, 8, 10, 1, 2, 1})
  List.forEach(sorted, x => Js.log(x))
}
