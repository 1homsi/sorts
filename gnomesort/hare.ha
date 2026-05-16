fn gnomesort(arr: []int) void = {
  let i = 0z;
  for (i < len(arr)) {
    if (i == 0z) {
      i += 1;
    } else if (arr[i] < arr[i - 1z]) {
      let temp = arr[i];
      arr[i] = arr[i - 1z];
      arr[i - 1z] = temp;
      i -= 1;
    } else {
      i += 1;
    };
  };
};

export fn main() void = {
  let test = [5, 2, 8, 1, 9, 3];
  gnomesort(test);
  for (let i = 0z; i < len(test); i += 1) {
    fmt::print("{}\n", test[i]);
  };
};
