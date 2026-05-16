define method quicksort (arr :: <simple-vector>, low :: <integer>, high :: <integer>) => ()
  when (low < high)
    let p = partition(arr, low, high);
    quicksort(arr, low, p - 1);
    quicksort(arr, p + 1, high);
  end when;
end method;

define method partition (arr :: <simple-vector>, low :: <integer>, high :: <integer>) => (p :: <integer>)
  let pivot = arr[high];
  let i = low;
  for (j from low below high)
    when (arr[j] <= pivot)
      let tmp = arr[i];
      arr[i] := arr[j];
      arr[j] := tmp;
      i := i + 1;
    end when;
  end for;
  let tmp = arr[i];
  arr[i] := arr[high];
  arr[high] := tmp;
  i
end method;

let arr = vector(3, 6, 8, 10, 1, 2, 1);
quicksort(arr, 0, size(arr) - 1);
format-out("%=\n", arr);
