{arr -> [5,3,1,4,2] * n -> 5}
selection_sort(arr, n):
  i := 0;
  while i < n do
    {arr -> [...] * i -> _ * n -> 5}
    min_idx := i;
    j := i + 1;
    while j < n do
      if arr[j] < arr[min_idx] then
        min_idx := j
      j := j + 1
    swap(arr, i, min_idx);
    i := i + 1
{sorted(arr, n)}
