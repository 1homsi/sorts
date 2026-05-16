use fmt;

fn insertionSort(arr: []int) void = {
  for (let i = 1z; i < len(arr); i += 1) {
    let key = arr[i];
    let mut j = i - 1;
    for (j >= 0 && arr[j] > key) {
      arr[j+1] = arr[j];
      j -= 1;
    };
    arr[j+1] = key;
  };
};

export fn main() void = {
  let arr: [6]int = [5, 2, 8, 1, 9, 3];
  insertionSort(arr[..]);
  fmt::println("{}", arr);
};