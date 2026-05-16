proc countingSort(arr: [?D] int): [] int {
  var n = arr.size;
  if n == 0 then return arr;
  var minVal = arr[D.low], maxVal = arr[D.low];
  for v in arr {
    if v < minVal then minVal = v;
    if v > maxVal then maxVal = v;
  }
  var range = maxVal - minVal + 1;
  var count: [0..range-1] int = 0;
  for v in arr do count[v - minVal] += 1;
  for i in 1..range-1 do count[i] += count[i - 1];
  var output: [0..n-1] int;
  for i in (n-1)..0 by -1 {
    count[arr[D.low + i] - minVal] -= 1;
    output[count[arr[D.low + i] - minVal]] = arr[D.low + i];
  }
  return output;
}

var arr = [4, 2, 2, 8, 3, 3, 1];
writeln(countingSort(arr));
