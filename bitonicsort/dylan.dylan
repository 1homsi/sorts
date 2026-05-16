module: bitonic-sort

define function compare-and-swap (arr :: <vector>, i :: <integer>, j :: <integer>, direction :: <boolean>) => ()
  when (direction = (arr[i] > arr[j]))
    let tmp = arr[i];
    arr[i] := arr[j];
    arr[j] := tmp;
  end when;
end function;

define function bitonic-merge (arr :: <vector>, lo :: <integer>, cnt :: <integer>, direction :: <boolean>) => ()
  when (cnt > 1)
    let k = floor/(cnt, 2);
    for (i from lo below lo + k)
      compare-and-swap(arr, i, i + k, direction);
    end for;
    bitonic-merge(arr, lo, k, direction);
    bitonic-merge(arr, lo + k, k, direction);
  end when;
end function;

define function bitonic-sort (arr :: <vector>, lo :: <integer>, cnt :: <integer>, direction :: <boolean>) => ()
  when (cnt > 1)
    let k = floor/(cnt, 2);
    bitonic-sort(arr, lo, k, #t);
    bitonic-sort(arr, lo + k, k, #f);
    bitonic-merge(arr, lo, cnt, direction);
  end when;
end function;

let data = vector(3, 7, 4, 8, 6, 2, 1, 5);
bitonic-sort(data, 0, size(data), #t);
for (x in data) format-out("%d ", x) end;
format-out("\n");
