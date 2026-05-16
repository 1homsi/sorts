{ arr -> [3, 6, 8, 10, 1, 2, 1] * n -> 7 }

procedure partition(arr, low, high)
  { arr -> A * low -> l * high -> h * l < h }
  pivot = arr[high];
  i = low;
  j = low;
  while j < high do
    { arr -> A * i -> I * j -> J * I <= J }
    if arr[j] <= pivot then
      tmp = arr[i]; arr[i] = arr[j]; arr[j] = tmp;
      i = i + 1
    end;
    j = j + 1
  done;
  tmp = arr[i]; arr[i] = arr[high]; arr[high] = tmp;
  return i
  { arr -> A' * result -> P * (forall k. l<=k<P => A'[k] <= A'[P]) }
end

procedure quicksort(arr, low, high)
  { arr -> A }
  if low < high then
    p = partition(arr, low, high);
    quicksort(arr, low, p - 1);
    quicksort(arr, p + 1, high)
  end
  { arr -> A' * sorted(A', low, high) }
end

{ arr -> [1, 1, 2, 3, 6, 8, 10] }
