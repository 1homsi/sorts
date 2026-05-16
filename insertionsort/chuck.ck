fun insertionSort(int arr[]) {
  int n = arr.cap();
  for (1 => int i; i < n; i++) {
    int key = arr[i];
    (i - 1) => int j;
    while (j >= 0 && arr[j] > key) {
      (arr[j] => arr[j+1]);
      j--;
    }
    (key => arr[j+1]);
  }
  return arr;
}

int myarr[6];
[5, 2, 8, 1, 9, 3] @=> myarr;
insertionSort(myarr);
for (0 => int i; i < 6; i++) {
  <<< myarr[i] >>>;
}