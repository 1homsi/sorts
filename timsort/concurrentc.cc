#include <stdio.h>
#include <process.h>

typedef struct {
  int* arr;
  int minSize;
  int left;
  int right;
} sort_params_t;

void timsort(int* arr, int len, int minSize) {
  mergesort(arr, 0, len - 1, minSize);
}

void mergesort(int* arr, int left, int right, int minSize) {
  if (left >= right) {
    return;
  }
  if (right - left + 1 <= minSize) {
    insertionsort(arr, left, right);
    return;
  }
  
  int mid = left + (right - left) / 2;
  
  int tid1 = tfork(mergesort_thread, arr, left, mid, minSize);
  int tid2 = tfork(mergesort_thread, arr, mid + 1, right, minSize);
  
  tjoin(tid1);
  tjoin(tid2);
  
  merge(arr, left, mid, right);
}

void mergesort_thread(int* arr, int left, int right, int minSize) {
  mergesort(arr, left, right, minSize);
}

void insertionsort(int* arr, int left, int right) {
  for (int i = left + 1; i <= right; i++) {
    int key = arr[i];
    int j = i - 1;
    while (j >= left && arr[j] > key) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = key;
  }
}

void merge(int* arr, int left, int mid, int right) {
  int* temp = malloc((right - left + 1) * sizeof(int));
  int i = left, j = mid + 1, k = 0;
  
  while (i <= mid && j <= right) {
    if (arr[i] <= arr[j]) {
      temp[k++] = arr[i++];
    } else {
      temp[k++] = arr[j++];
    }
  }
  
  while (i <= mid) {
    temp[k++] = arr[i++];
  }
  while (j <= right) {
    temp[k++] = arr[j++];
  }
  
  for (int i = left; i <= right; i++) {
    arr[i] = temp[i - left];
  }
  free(temp);
}

int main() {
  int arr[6] = {5, 2, 8, 1, 9, 3};
  timsort(arr, 6, 32);
  printf("%d %d %d %d %d %d\n", arr[0], arr[1], arr[2], arr[3], arr[4], arr[5]);
  return 0;
}
