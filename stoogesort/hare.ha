export fn stoogesort(a: []int, i: int, j: int) void = {
  if (a[j] < a[i]) {
    let temp = a[j];
    a[j] = a[i];
    a[i] = temp;
  };
  if (j - i > 1) {
    let t = (j - i + 1) / 3;
    stoogesort(a, i, j - t);
    stoogesort(a, i + t, j);
    stoogesort(a, i, j - t);
  };
};

export fn main() void = {
  let arr = [5, 2, 8, 1, 9, 3];
  stoogesort(arr, 0, 5);
};
