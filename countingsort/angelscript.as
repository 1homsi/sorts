array<int> countingsort(array<int> arr) {
  if (arr.length() == 0) return arr;

  int max = 0;
  for (uint i = 0; i < arr.length(); i++) {
    if (arr[i] > max) max = arr[i];
  }

  array<int> count(max + 1);
  for (int i = 0; i <= max; i++) {
    count[i] = 0;
  }

  for (uint i = 0; i < arr.length(); i++) {
    count[arr[i]]++;
  }

  array<int> output;
  for (int i = 0; i <= max; i++) {
    for (int j = 0; j < count[i]; j++) {
      output.insertLast(i);
    }
  }

  return output;
}

void main() {
  array<int> test = {5, 2, 8, 1, 9, 3};
  array<int> result = countingsort(test);
  for (uint i = 0; i < result.length(); i++) {
    print(result[i]);
  }
}
