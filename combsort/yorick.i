func comb_sort(arr) {
  gap = numberof(arr);
  swapped = 1;
  while (gap > 1 | swapped) {
    gap = int(gap * 10.0 / 13.0);
    if (gap < 1) gap = 1;
    swapped = 0;
    for (i = 1; i <= numberof(arr) - gap; ++i) {
      if (arr(i) > arr(i + gap)) {
        temp = arr(i);
        arr(i) = arr(i + gap);
        arr(i + gap) = temp;
        swapped = 1;
      }
    }
  }
  return arr;
}

sample = [5, 2, 8, 1, 9, 3];
result = comb_sort(sample);
write, format="%d ", result;
