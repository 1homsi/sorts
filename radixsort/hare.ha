use fmt;

export fn radixsort(arr: []int) []int = {
  let max: int = 0;
  for (let i = 0; i < len(arr); i += 1) {
    if (arr[i] > max) max = arr[i];
  };

  let exp: int = 1;
  for (max / exp > 0) {
    exp *= 10;
  };

  return arr;
};

export fn main() void = {
  let arr: [_]int = [5, 2, 8, 1, 9, 3];
  fmt::println(radixsort(arr[:])!);
};
