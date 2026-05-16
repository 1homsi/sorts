void CombSort(array<int>& arr) {
  int gap = arr.length();
  bool swapped = true;
  while (gap > 1 || swapped) {
    gap = (gap * 10) / 13;
    if (gap < 1) gap = 1;
    swapped = false;
    for (int i = 0; i < arr.length() - gap; i++) {
      if (arr[i] > arr[i + gap]) {
        int temp = arr[i];
        arr[i] = arr[i + gap];
        arr[i + gap] = temp;
        swapped = true;
      }
    }
  }
}

void main() {
  array<int> sample = {5, 2, 8, 1, 9, 3};
  CombSort(sample);
  for (uint i = 0; i < sample.length(); i++) {
    print(sample[i] + "\n");
  }
}
