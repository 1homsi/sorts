public int[] bogosort(int[] arr) {
  while (!issorted(arr)) {
    shuffle(arr);
  }
  return arr;
}

public bool issorted(int[] arr) {
  for (int i = 0; i < sizeof(arr) - 1; i++) {
    if (arr[i] > arr[i+1]) {
      return false;
    }
  }
  return true;
}

public void shuffle(int[] arr) {
  for (int i = 0; i < sizeof(arr); i++) {
    int j = random(sizeof(arr));
    int tmp = arr[i];
    arr[i] = arr[j];
    arr[j] = tmp;
  }
}

public void test() {
  int arr[] = {3, 1, 2};
  bogosort(arr);
  PrintToChat(null, "Sorted");
}
