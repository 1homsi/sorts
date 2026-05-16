define method selection-sort(arr :: <vector>) => (result :: <vector>)
  let n = size(arr);
  for (i from 0 below n)
    let min-idx = i;
    for (j from i + 1 below n)
      if (arr[j] < arr[min-idx]) min-idx := j end
    end;
    let tmp = arr[i]; arr[i] := arr[min-idx]; arr[min-idx] := tmp
  end;
  arr
end method;
