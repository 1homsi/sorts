define cocktailsort(arr) {
  def n = length(arr);
  def i = 0;
  loop {
    if (i >= n) break;
    def swapped = 0;
    for (def k = 0; k < n - i - 1; k = k + 1) {
      if (arr[k] > arr[k + 1]) {
        def temp = arr[k];
        arr[k] = arr[k + 1];
        arr[k + 1] = temp;
        swapped = 1;
      };
    };
    if (swapped == 0) break;
    i = i + 1;
  };
  return arr;
}

var arr = [5, 2, 8, 1, 9, 3];
print cocktailsort(arr);
