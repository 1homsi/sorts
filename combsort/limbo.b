implement Comb;

include "sys.m";

Comb: module {
  combsort: fn(arr: array of int);
};

combsort(arr: array of int) {
  gap := len arr;
  swapped := 1;
  while (gap > 1 || swapped) {
    gap = (gap * 10) / 13;
    if (gap < 1) gap = 1;
    swapped = 0;
    for (i := 0; i < len arr - gap; i++) {
      if (arr[i] > arr[i + gap]) {
        temp := arr[i];
        arr[i] = arr[i + gap];
        arr[i + gap] = temp;
        swapped = 1;
      }
    }
  }
}

init() {
  arr := array[6] of {5, 2, 8, 1, 9, 3};
  combsort(arr);
  for (i := 0; i < 6; i++) {
    sys->print("%d ", arr[i]);
  }
}
