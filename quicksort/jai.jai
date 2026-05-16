main :: () {
  arr := int.[5, 2, 8, 1, 9, 3];
  sorted := quicksort(arr);
  print(sorted);
}

quicksort :: (arr: []int) -> []int {
  if arr.count <= 1 return arr;

  pivot := arr[0];
  less := array_allocate(int, arr.count);
  greater := array_allocate(int, arr.count);

  for i : 1..arr.count - 1 {
    if arr[i] <= pivot
      array_add(*less, arr[i]);
    else
      array_add(*greater, arr[i]);
  }

  return quicksort(less) + .[pivot] + quicksort(greater);
}