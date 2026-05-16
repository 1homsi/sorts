public quicksort(arr[], size) {
  if (size <= 1)
    return;

  new pivot = arr[0];
  new less[size] = {.count = 0};
  new greater[size] = {.count = 0};

  for (new i = 1; i < size; i++) {
    if (arr[i] <= pivot) {
      less[less.count] = arr[i];
      less.count++;
    } else {
      greater[greater.count] = arr[i];
      greater.count++;
    }
  }

  quicksort(less, less.count);
  quicksort(greater, greater.count);
}

main() {
  new arr[6] = {5, 2, 8, 1, 9, 3};
  quicksort(arr, 6);
  for (new i = 0; i < 6; i++) {
    printf("%d ", arr[i]);
  }
}