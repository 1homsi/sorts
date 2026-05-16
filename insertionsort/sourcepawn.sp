insertionSort(arr[], size)
{
  for (new i = 1; i < size; i++) {
    new key = arr[i];
    new j = i - 1;
    while (j >= 0 && arr[j] > key) {
      arr[j+1] = arr[j];
      j--;
    }
    arr[j+1] = key;
  }
}

public main()
{
  new arr[] = {5, 2, 8, 1, 9, 3};
  insertionSort(arr, 6);
  for (new i = 0; i < 6; i++) {
    printf("%d ", arr[i]);
  }
}