module: timsort

define constant $min-run = 32;

define function insertion-sort!(arr :: <simple-vector>, left :: <integer>, right :: <integer>)
  for (i from left + 1 to right)
    let key = arr[i];
    let j = i - 1;
    iterate loop(j :: <integer> = j)
      if (j >= left & arr[j] > key)
        arr[j + 1] := arr[j];
        loop(j - 1)
      else
        arr[j + 1] := key
      end if
    end iterate
  end for
end function;

define function merge!(arr :: <simple-vector>, left :: <integer>, mid :: <integer>, right :: <integer>)
  let lp = copy-sequence(arr, start: left, end: mid + 1);
  let rp = copy-sequence(arr, start: mid + 1, end: right + 1);
  let i = 0; let j = 0; let k = left;
  while (i < size(lp) & j < size(rp))
    if (lp[i] <= rp[j])
      arr[k] := lp[i]; i := i + 1
    else
      arr[k] := rp[j]; j := j + 1
    end if;
    k := k + 1
  end while;
  while (i < size(lp)) arr[k] := lp[i]; i := i + 1; k := k + 1 end while;
  while (j < size(rp)) arr[k] := rp[j]; j := j + 1; k := k + 1 end while
end function;

define function timsort!(arr :: <simple-vector>)
  let n = size(arr);
  let i = 0;
  while (i < n)
    insertion-sort!(arr, i, min(i + $min-run - 1, n - 1));
    i := i + $min-run
  end while;
  let size = $min-run;
  while (size < n)
    let left = 0;
    while (left < n)
      let mid = min(left + size - 1, n - 1);
      let right = min(left + 2 * size - 1, n - 1);
      if (mid < right) merge!(arr, left, mid, right) end if;
      left := left + 2 * size
    end while;
    size := size * 2
  end while
end function;

let arr = vector(5, 2, 8, 1, 9, 3, 7, 4, 6);
timsort!(arr);
format-out("%=\n", arr);
