void insertionSort(List<double> bucket) {
  for (int i = 1; i < bucket.length; i++) {
    double key = bucket[i];
    int j = i - 1;
    while (j >= 0 && bucket[j] > key) {
      bucket[j + 1] = bucket[j];
      j--;
    }
    bucket[j + 1] = key;
  }
}

List<double> bucketSort(List<double> arr) {
  int n = arr.length;
  if (n == 0) return arr;
  double min = arr.reduce((a, b) => a < b ? a : b);
  double max = arr.reduce((a, b) => a > b ? a : b);
  List<List<double>> buckets = List.generate(n, (_) => []);
  for (double num in arr) {
    int idx = ((num - min) / (max - min + 1) * n).toInt();
    if (idx >= n) idx = n - 1;
    buckets[idx].add(num);
  }
  List<double> result = [];
  for (var bucket in buckets) {
    insertionSort(bucket);
    result.addAll(bucket);
  }
  return result;
}

void main() {
  print(bucketSort([0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]));
}
