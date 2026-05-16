function array<int> Quicksort(array<int> arr)
{
  local array<int> less, greater;
  local int pivot, i;

  if (arr.Length <= 1)
    return arr;

  pivot = arr[0];
  for (i = 1; i < arr.Length; i++)
  {
    if (arr[i] <= pivot)
      less[less.Length] = arr[i];
    else
      greater[greater.Length] = arr[i];
  }

  return Quicksort(less) @ pivot @ Quicksort(greater);
}

simulated function test()
{
  local array<int> result;
  result = Quicksort(arr);
  `log(result);
}