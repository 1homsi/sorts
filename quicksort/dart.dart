List<int> quicksort(List<int> arr) {
  if (arr.length <= 1) return arr;
  int pivot = arr[arr.length ~/ 2];
  List<int> left = arr.where((x) => x < pivot).toList();
  List<int> middle = arr.where((x) => x == pivot).toList();
  List<int> right = arr.where((x) => x > pivot).toList();
  return [...quicksort(left), ...middle, ...quicksort(right)];
}

void main() {
  print(quicksort([3, 6, 8, 10, 1, 2, 1]));
}
