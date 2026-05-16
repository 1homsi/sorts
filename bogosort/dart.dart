import 'dart:math';

bool isSorted(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    if (arr[i] > arr[i + 1]) return false;
  }
  return true;
}

void shuffle(List<int> arr) {
  final rng = Random();
  for (int i = arr.length - 1; i > 0; i--) {
    int j = rng.nextInt(i + 1);
    int tmp = arr[i];
    arr[i] = arr[j];
    arr[j] = tmp;
  }
}

List<int> bogosort(List<int> arr) {
  while (!isSorted(arr)) {
    shuffle(arr);
  }
  return arr;
}

void main() {
  List<int> arr = [3, 1, 4, 1, 5, 9, 2, 6];
  print(bogosort(arr));
}
