function Merge(out Array<int> arr, int left, int mid, int right) {
  local int i, j, k;
  local Array<int> result;
  
  i = left;
  j = mid + 1;
  k = 0;
  result.Length = right - left + 1;
  
  while (i <= mid && j <= right) {
    if (arr[i] <= arr[j]) {
      result[k] = arr[i];
      i++;
    } else {
      result[k] = arr[j];
      j++;
    }
    k++;
  }
  
  while (i <= mid) {
    result[k] = arr[i];
    i++;
    k++;
  }
  
  while (j <= right) {
    result[k] = arr[j];
    j++;
    k++;
  }
  
  for (k = 0; k < result.Length; k++) {
    arr[left + k] = result[k];
  }
}

function MergeSort(out Array<int> arr, int left, int right) {
  local int mid;
  
  if (left < right) {
    mid = (left + right) / 2;
    MergeSort(arr, left, mid);
    MergeSort(arr, mid + 1, right);
    Merge(arr, left, mid, right);
  }
}

defaultproperties {
  {
    local Array<int> arr;
    arr[0] = 5; arr[1] = 2; arr[2] = 8; arr[3] = 1; arr[4] = 9; arr[5] = 3;
    MergeSort(arr, 0, 5);
    `log(arr);
  }
}
