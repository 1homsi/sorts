#include <sourcemod>

public void GnomeSort(int arr[], int len) {
  int i = 0;
  int temp;

  while (i < len) {
    if (i == 0) {
      i++;
    } else if (arr[i] < arr[i - 1]) {
      temp = arr[i];
      arr[i] = arr[i - 1];
      arr[i - 1] = temp;
      i--;
    } else {
      i++;
    }
  }
}

public void OnPluginStart() {
  int test[] = {5, 2, 8, 1, 9, 3};
  GnomeSort(test, 6);
  PrintToServer("%d %d %d %d %d %d", test[0], test[1], test[2], test[3], test[4], test[5]);
}
