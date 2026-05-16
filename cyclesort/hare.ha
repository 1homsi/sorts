use fmt;

fn cyclesort(arr: []int) void = {
  let n = len(arr);
  let mut pos = 0;
  for (pos < n; pos += 1) {
    let item = arr[pos];
    let mut cycles = 0;
    for (let i = 0; i < n; i += 1) {
      if (i != pos && arr[i] < item) {
        cycles += 1;
      }
    }
    if (cycles != 0) {
      for (arr[pos] == item; pos += 1) void;
      let temp = arr[pos];
      arr[pos] = item;
      let mut item = temp;
      for (cycles > 0; cycles -= 1) {
        cycles = 0;
        for (let i = 0; i < n; i += 1) {
          if (i != pos && arr[i] < item) {
            cycles += 1;
          }
        }
        for (arr[pos] == item; pos += 1) void;
        temp = arr[pos];
        arr[pos] = item;
        item = temp;
      }
    }
  }
};

export fn main() void = {
  let arr = [5, 2, 8, 1, 9, 3];
  cyclesort(arr);
  fmt::println(arr)!;
};
