func bogosort(arr) {
  while (!issorted(arr)) {
    shuffle, arr;
  }
  return arr;
}

func issorted(arr) {
  for (i = 1; i < numberof(arr) - 1; i++) {
    if (arr(i) > arr(i+1)) return 0;
  }
  return 1;
}

func shuffle(arr) {
  n = numberof(arr);
  for (i = 1; i <= n; i++) {
    j = long(random() * n) + 1;
    tmp = arr(i);
    arr(i) = arr(j);
    arr(j) = tmp;
  }
}

arr = [3, 1, 2];
print, bogosort(arr);
