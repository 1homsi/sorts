module: heapsort

define function heapify(arr :: <vector>, n :: <integer>, i :: <integer>) => ()
  let largest = i;
  let left = 2 * i + 1;
  let right = 2 * i + 2;
  if (left < n & arr[left] > arr[largest]) largest := left end;
  if (right < n & arr[right] > arr[largest]) largest := right end;
  unless (largest = i)
    let tmp = arr[i];
    arr[i] := arr[largest];
    arr[largest] := tmp;
    heapify(arr, n, largest)
  end
end function;

define function heapsort(arr :: <vector>) => ()
  let n = arr.size;
  for (i from n // 2 - 1 to 0 by -1) heapify(arr, n, i) end;
  for (i from n - 1 to 1 by -1)
    let tmp = arr[0]; arr[0] := arr[i]; arr[i] := tmp;
    heapify(arr, i, 0)
  end
end function;

let arr = vector(12, 11, 13, 5, 6, 7);
heapsort(arr);
format-out("%=\n", arr);
