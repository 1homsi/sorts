#include <sourcemod>

public void CombSort(int[] arr, int len) {
  int gap = len;
  bool swapped = true;

  while (gap > 1 || swapped) {
    gap = (gap * 10) / 13;
    if (gap < 1) gap = 1;
    swapped = false;

    for (int i = 0; i < len - gap; i++) {
      if (arr[i] > arr[i + gap]) {
        int temp = arr[i];
        arr[i] = arr[i + gap];
        arr[i + gap] = temp;
        swapped = true;
      }
    }
  }
}

public void OnPluginStart() {
  int sample[6] = {5, 2, 8, 1, 9, 3};
  CombSort(sample, 6);
  for (int i = 0; i < 6; i++) {
    PrintToServer("%d", sample[i]);
  }
}
