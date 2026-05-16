use fmt;

fn comb_sort(arr: []int) void = {
  let gap = len(arr);
  let swapped = true;
  for (gap > 1 || swapped) {
    gap = (gap * 10) / 13;
    if (gap < 1) gap = 1;
    swapped = false;
    for (let i = 0; i < len(arr) - gap; i += 1) {
      if (arr[i] > arr[i + gap]) {
        let temp = arr[i];
        arr[i] = arr[i + gap];
        arr[i + gap] = temp;
        swapped = true;
      };
    };
  };
};

export fn main() void = {
  let sample: [6]int = [5, 2, 8, 1, 9, 3];
  comb_sort(sample[..]);
  for (let i = 0; i < 6; i += 1) {
    fmt::printfln("{}", sample[i])?;
  };
};
