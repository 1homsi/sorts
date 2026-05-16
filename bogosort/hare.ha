use fmt;
use types;

fn bogosort(arr: []int) void = {
  for (!issorted(arr)) {
    shuffle(arr);
  };
};

fn issorted(arr: []int) bool = {
  for (let i = 0z; i < len(arr) - 1; i += 1) {
    if (arr[i] > arr[i + 1]) {
      return false;
    };
  };
  return true;
};

fn shuffle(arr: []int) void = {
  for (let i = 0z; i < len(arr); i += 1) {
    let j = (std::random() % len(arr));
    let tmp = arr[i];
    arr[i] = arr[j];
    arr[j] = tmp;
  };
};

export fn main() void = {
  let arr: [3]int = [3, 1, 2];
  bogosort(arr[..]);
  fmt::print("{}\n", arr);
};
