#include <sourcemod>

public Plugin myinfo =
{
  name = "TimSort",
  author = "Author",
  description = "TimSort Implementation",
  version = "1.0.0",
  url = "http://example.com"
};

int[] TimSort(int[] arr, int minSize = 32) {
  return MergeSort(arr, minSize);
}

int[] MergeSort(int[] arr, int minSize) {
  int len = sizeof(arr);
  if (len <= 1) {
    return arr;
  }
  if (len <= minSize) {
    return InsertionSort(arr);
  }
  
  int mid = len / 2;
  int left[mid];
  int right[len - mid];
  
  for (int i = 0; i < mid; i++) {
    left[i] = arr[i];
  }
  for (int i = mid; i < len; i++) {
    right[i - mid] = arr[i];
  }
  
  return Merge(MergeSort(left, minSize), MergeSort(right, minSize));
}

int[] InsertionSort(int[] arr) {
  int len = sizeof(arr);
  for (int i = 1; i < len; i++) {
    int key = arr[i];
    int j = i - 1;
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = key;
  }
  return arr;
}

int[] Merge(int[] left, int[] right) {
  int llen = sizeof(left);
  int rlen = sizeof(right);
  int result[llen + rlen];
  int i = 0, j = 0, k = 0;
  
  while (i < llen && j < rlen) {
    if (left[i] <= right[j]) {
      result[k] = left[i];
      i++;
    } else {
      result[k] = right[j];
      j++;
    }
    k++;
  }
  
  while (i < llen) {
    result[k] = left[i];
    i++;
    k++;
  }
  while (j < rlen) {
    result[k] = right[j];
    j++;
    k++;
  }
  
  return result;
}

public void OnPluginStart() {
  int arr[6] = {5, 2, 8, 1, 9, 3};
  TimSort(arr);
}
