void shellsort(int[] arr) {
  int n = arr.length;
  int gap = 1;
  while (gap <= n) gap = gap * 3 + 1;
  while (gap > 0) {
    gap = gap / 3;
    for (int i = gap; i < n; i++) {
      int temp = arr[i];
      int j = i;
      while (j >= gap && arr[j - gap] > temp) {
        arr[j] = arr[j - gap];
        j -= gap;
      }
      arr[j] = temp;
    }
  }
}
void setup() {
  int[] arr = {5, 2, 8, 1, 9, 3};
  shellsort(arr);
  println(arr);
}
void draw() {}
