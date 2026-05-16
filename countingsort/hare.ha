use fmt;

fn countingsort(arr: []int) []int = {
  if (len(arr) == 0) return arr;

  let mut max = 0;
  for (let i = 0; i < len(arr); i += 1) {
    if (arr[i] > max) max = arr[i];
  };

  let count = alloc([0...max], max + 1);
  for (let i = 0; i <= max; i += 1) {
    count[i] = 0;
  };

  for (let i = 0; i < len(arr); i += 1) {
    count[arr[i]] += 1;
  };

  let output = alloc([0...max], len(arr));
  let mut out_idx = 0;
  for (let i = 0; i <= max; i += 1) {
    for (let j = 0; j < count[i]; j += 1) {
      output[out_idx] = i;
      out_idx += 1;
    };
  };

  return output;
};

export fn main() void = {
  let arr = [5, 2, 8, 1, 9, 3];
  let result = countingsort(arr);
  fmt::printfln("Result: {}", result);
};
