void bogosort(array<int>& arr) {
  while (!issorted(arr)) {
    shuffle(arr);
  }
}

bool issorted(const array<int>& arr) {
  for (uint i = 0; i < arr.length() - 1; i++) {
    if (arr[i] > arr[i + 1]) {
      return false;
    }
  }
  return true;
}

void shuffle(array<int>& arr) {
  for (uint i = 0; i < arr.length(); i++) {
    uint j = rand() % arr.length();
    int tmp = arr[i];
    arr[i] = arr[j];
    arr[j] = tmp;
  }
}

void main() {
  array<int> arr = {3, 1, 2};
  bogosort(arr);
  print(arr);
}
