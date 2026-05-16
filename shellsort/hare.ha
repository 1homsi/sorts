use fmt;
export fn main() void = {
  let arr: [6]int = [5, 2, 8, 1, 9, 3];
  shellsort(&arr);
  fmt::println("{}!", arr);
};
fn shellsort(arr: *[6]int) void = {
  let n = len(arr);
  let mut gap = 1;
  for (gap <= n) gap = gap * 3 + 1;
  for (gap > 0) {
    gap = gap / 3;
    for (let i = gap; i < n; i += 1) {
      let temp = arr[i];
      let mut j = i;
      for (j >= gap && arr[j - gap] > temp) {
        arr[j] = arr[j - gap];
        j -= gap;
      };
      arr[j] = temp;
    };
  };
};
