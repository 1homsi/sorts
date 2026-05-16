use fmt;

fn bubblesort(arr: []int) void = {
  let n = len(arr);
  for (let i = 0z; i < n; i += 1) {
    for (let j = 0z; j < n - 1 - i; j += 1) {
      if (arr[j] > arr[j+1]) {
        let temp = arr[j];
        arr[j] = arr[j+1];
        arr[j+1] = temp;
      };
    };
  };
};

export fn main() void = {
  let arr = [5, 2, 8, 1, 9, 3];
  bubblesort(arr);
  fmt::printfln("{}", arr);
};