func quicksort(arr)
{
  if (numberof(arr) <= 1)
    return arr;

  pivot = arr(1);
  less = arr(where(arr(2:) <= pivot)) + pivot;
  greater = arr(where(arr(2:) > pivot));

  return grow(quicksort(less), quicksort(greater));
}

arr = [5, 2, 8, 1, 9, 3];
print, quicksort(arr);