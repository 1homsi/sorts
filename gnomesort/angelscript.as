void GnomeSort(array<int> arr) {
  int i = 0;
  int temp;

  while (i < int(arr.length())) {
    if (i == 0) {
      i++;
    } else if (arr[i] < arr[i - 1]) {
      temp = arr[i];
      arr[i] = arr[i - 1];
      arr[i - 1] = temp;
      i--;
    } else {
      i++;
    }
  }
}

void main() {
  array<int> test = {5, 2, 8, 1, 9, 3};
  GnomeSort(test);
  for (int i = 0; i < int(test.length()); i++) {
    print(test[i] + " ");
  }
}
