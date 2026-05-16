#include <core>

public bogosort(arr[], n) {
  new sorted, i, j, tmp;

  sorted = 0;
  while (!sorted) {
    sorted = 1;
    for (i = 0; i < n - 1; i++) {
      if (arr[i] > arr[i + 1]) {
        sorted = 0;
        break;
      }
    }
    if (!sorted) {
      for (i = 0; i < n; i++) {
        j = random(n);
        tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
      }
    }
  }
}

public main() {
  new arr[3] = {3, 1, 2};
  bogosort(arr, 3);
  for (new i = 0; i < 3; i++) {
    printf("%d ", arr[i]);
  }
}
