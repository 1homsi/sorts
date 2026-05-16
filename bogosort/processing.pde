int[] bogosort(int[] arr) {
  while (!issorted(arr)) {
    shuffle(arr);
  }
  return arr;
}

boolean issorted(int[] arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    if (arr[i] > arr[i+1]) {
      return false;
    }
  }
  return true;
}

void shuffle(int[] arr) {
  for (int i = 0; i < arr.length; i++) {
    int j = (int)random(arr.length);
    int tmp = arr[i];
    arr[i] = arr[j];
    arr[j] = tmp;
  }
}

void setup() {
  int[] arr = {3, 1, 2};
  bogosort(arr);
  println(arr);
}
