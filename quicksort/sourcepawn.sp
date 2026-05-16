public int[] quicksort(int[] arr, int size) {
  if (size <= 1)
    return arr;

  int pivot = arr[0];
  int less[size];
  int greater[size];
  int li = 0, gi = 0;

  for (int i = 1; i < size; i++) {
    if (arr[i] <= pivot) {
      less[li++] = arr[i];
    } else {
      greater[gi++] = arr[i];
    }
  }

  int result[size];
  int idx = 0;
  for (int i = 0; i < li; i++)
    result[idx++] = less[i];
  result[idx++] = pivot;
  for (int i = 0; i < gi; i++)
    result[idx++] = greater[i];

  return result;
}

public main() {
  int arr[] = {5, 2, 8, 1, 9, 3};
  print_result(quicksort(arr, 6));
}