fun int[] bogosort(int arr[]) {
  while (!issorted(arr)) {
    shuffle(arr);
  }
  return arr;
}

fun int issorted(int arr[]) {
  for (0 => int i; i < arr.size() - 1; i++) {
    if (arr[i] > arr[i+1]) {
      return 0;
    }
  }
  return 1;
}

fun void shuffle(int arr[]) {
  for (0 => int i; i < arr.size(); i++) {
    int j = Math.random2(0, arr.size());
    int tmp = arr[i];
    arr[i] = arr[j];
    arr[j] = tmp;
  }
}

[3, 1, 2] @=> int arr[];
bogosort(arr) => void;
arr.size() => int size;
