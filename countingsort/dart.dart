void countingSort(List<int> arr) {
  if (arr.isEmpty) return;
  int max = arr.reduce((a, b) => a > b ? a : b);
  int min = arr.reduce((a, b) => a < b ? a : b);
  int range = max - min + 1;
  List<int> count = List.filled(range, 0);
  for (int v in arr) count[v - min]++;
  for (int i = 1; i < range; i++) count[i] += count[i - 1];
  List<int> output = List.filled(arr.length, 0);
  for (int i = arr.length - 1; i >= 0; i--) {
    output[--count[arr[i] - min]] = arr[i];
  }
  for (int i = 0; i < arr.length; i++) arr[i] = output[i];
}

void main() {
  List<int> arr = [4, 2, 2, 8, 3, 3, 1];
  countingSort(arr);
  print(arr);
}
