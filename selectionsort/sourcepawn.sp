#include <sourcemod>

public Action SelectionSort(Handle array) {
  int n = GetArraySize(array);
  for (int i = 0; i < n - 1; i++) {
    int minIdx = i;
    for (int j = i + 1; j < n; j++) {
      int valJ = GetArrayCell(array, j);
      int valMin = GetArrayCell(array, minIdx);
      if (valJ < valMin) {
        minIdx = j;
      }
    }
    int tmp = GetArrayCell(array, i);
    SetArrayCell(array, i, GetArrayCell(array, minIdx));
    SetArrayCell(array, minIdx, tmp);
  }
  return Plugin_Continue;
}

public void OnPluginStart() {}