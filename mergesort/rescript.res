let rec merge = (left: list<int>, right: list<int>): list<int> =>
  switch (left, right) {
  | (list{}, _) => right
  | (_, list{}) => left
  | (list{lh, ...lt}, list{rh, ...rt}) =>
    if lh <= rh {
      list{lh, ...merge(lt, right)}
    } else {
      list{rh, ...merge(left, rt)}
    }
  }

let rec mergeSort = (lst: list<int>): list<int> => {
  let n = List.length(lst)
  if n <= 1 {
    lst
  } else {
    let mid = n / 2
    let left = mergeSort(Belt.List.take(lst, mid)->Option.getOr(list{}))
    let right = mergeSort(Belt.List.drop(lst, mid)->Option.getOr(list{}))
    merge(left, right)
  }
}

let result = mergeSort(list{38, 27, 43, 3, 9, 82, 10})
Js.log(result)
