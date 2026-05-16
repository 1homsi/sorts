fun void merge(int arr[], int left, int mid, int right) {
  int result[right - left + 1];
  int i, j, k;
  
  left => i;
  mid + 1 => j;
  0 => k;
  
  while (i <= mid && j <= right) {
    if (arr[i] <= arr[j]) {
      arr[i] => result[k];
      i++;
    } else {
      arr[j] => result[k];
      j++;
    }
    k++;
  }
  
  while (i <= mid) {
    arr[i] => result[k];
    i++;
    k++;
  }
  
  while (j <= right) {
    arr[j] => result[k];
    j++;
    k++;
  }
  
  for (0 => k; k < result.size(); k++) {
    result[k] => arr[left + k];
  }
}

fun void mergesort(int arr[], int left, int right) {
  if (left < right) {
    (left + right) / 2 => int mid;
    mergesort(arr, left, mid);
    mergesort(arr, mid + 1, right);
    merge(arr, left, mid, right);
  }
}

int arr[6];
[5, 2, 8, 1, 9, 3] @=> arr;
mergesort(arr, 0, 5);
<<<"Sorted:", arr>>>;
