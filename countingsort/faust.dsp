import("stdfaust.lib");

max_val(n) = select2(n<=0, max_val(n-1), n);
count_at(i, arr) = 1 + count_at(i, arr);

countingsort(arr, max, count, i, j) = process {
  declare i 0;
  declare j 0;
  declare max 0;

  i = 0;
  while (i < 6) {
    if (arr[i] > max) {
      max = arr[i];
    };
    i = i + 1;
  };

  i = 0;
  while (i <= max) {
    count[i] = 0;
    i = i + 1;
  };

  i = 0;
  while (i < 6) {
    count[arr[i]] = count[arr[i]] + 1;
    i = i + 1;
  };

  i = 0;
  while (i <= max) {
    j = 0;
    while (j < count[i]) {
      print(i);
      j = j + 1;
    };
    i = i + 1;
  };
};

process = print([5, 2, 8, 1, 9, 3]);
