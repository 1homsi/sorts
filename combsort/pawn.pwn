public OnGameModeInit() {
  new arr[6] = {5, 2, 8, 1, 9, 3};
  CombSort(arr, 6);
  for (new i = 0; i < 6; i++) {
    printf("%d ", arr[i]);
  }
  return 1;
}

stock CombSort(arr[], len) {
  new gap = len;
  new swapped = 1;
  while (gap > 1 || swapped) {
    gap = (gap * 10) / 13;
    if (gap < 1) gap = 1;
    swapped = 0;
    for (new i = 0; i < len - gap; i++) {
      if (arr[i] > arr[i + gap]) {
        new temp = arr[i];
        arr[i] = arr[i + gap];
        arr[i + gap] = temp;
        swapped = 1;
      }
    }
  }
}
