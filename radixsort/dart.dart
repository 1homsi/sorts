void countingSort(List<int> arr, int exp) {
  int n = arr.length;
  List<int> output = List.filled(n, 0);
  List<int> count = List.filled(10, 0);
  for (int i = 0; i < n; i++) count[(arr[i] ~/ exp) % 10]++;
  for (int i = 1; i < 10; i++) count[i] += count[i - 1];
  for (int i = n - 1; i >= 0; i--) {
    int idx = (arr[i] ~/ exp) % 10;
    output[--count[idx]] = arr[i];
  }
  for (int i = 0; i < n; i++) arr[i] = output[i];
}

void radixSort(List<int> arr) {
  if (arr.isEmpty) return;
  int max = arr.reduce((a, b) => a > b ? a : b);
  for (int exp = 1; max ~/ exp > 0; exp *= 10) countingSort(arr, exp);
}

void main() {
  List<int> arr = [170, 45, 75, 90, 802, 24, 2, 66];
  radixSort(arr);
  print(arr);
}
