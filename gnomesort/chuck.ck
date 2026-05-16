fun int[] gnomesort(int arr[]) {
  int i;
  int temp;

  0 => i;
  while (i < arr.size()) {
    if (i == 0) {
      i++;
    } else if (arr[i] < arr[i - 1]) {
      arr[i] => temp;
      arr[i - 1] => arr[i];
      temp => arr[i - 1];
      i--;
    } else {
      i++;
    }
  }

  return arr;
}

int test[6];
[5, 2, 8, 1, 9, 3] @=> test;
gnomesort(test) => test;

for (0 => int i; i < test.size(); i++) {
  test[i] => std.cout;
}
