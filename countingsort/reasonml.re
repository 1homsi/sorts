let countingSort = (arr) => {
  let n = Array.length(arr);
  if (n == 0) { arr; }
  else {
    let minVal = Array.fold_left(min, arr[0], arr);
    let maxVal = Array.fold_left(max, arr[0], arr);
    let range = maxVal - minVal + 1;
    let count = Array.make(range, 0);
    Array.iter(v => count[v - minVal] = count[v - minVal] + 1, arr);
    for (i in 1 to range - 1) {
      count[i] = count[i] + count[i - 1];
    };
    let output = Array.make(n, 0);
    for (_ in 0 to n - 1) {
      let i = n - 1 - _;
      let v = arr[i];
      count[v - minVal] = count[v - minVal] - 1;
      output[count[v - minVal]] = v;
    };
    output;
  };
};

let result = countingSort([|4, 2, 2, 8, 3, 3, 1|]);
Array.iter(v => print_int(v) |> ignore, result);
print_newline();
