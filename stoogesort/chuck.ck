fun void stoogesort(int a[], int i, int j) {
  if (a[j] < a[i]) {
    int temp;
    temp => a[i];
    a[j] => a[i];
    temp => a[j];
  }
  if (j - i > 1) {
    int t;
    (j - i + 1) / 3 => t;
    stoogesort(a, i, j - t);
    stoogesort(a, i + t, j);
    stoogesort(a, i, j - t);
  }
}

int arr[6];
[5, 2, 8, 1, 9, 3] @=> arr;
stoogesort(arr, 0, 5);
arr.toString() => cout;
