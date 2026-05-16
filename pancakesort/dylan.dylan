module: pancake-sort

define function flip(arr :: <vector>, k :: <integer>) => ()
  let left = 0;
  let right = k;
  while (left < right)
    let tmp = arr[left];
    arr[left] := arr[right];
    arr[right] := tmp;
    left := left + 1;
    right := right - 1;
  end while;
end function;

define function find-max-idx(arr :: <vector>, size :: <integer>) => (idx :: <integer>)
  let max-idx = 0;
  for (i from 1 below size)
    if (arr[i] > arr[max-idx])
      max-idx := i;
    end if;
  end for;
  max-idx
end function;

define function pancake-sort(arr :: <vector>) => (arr :: <vector>)
  let size = arr.size;
  while (size > 1)
    let max-idx = find-max-idx(arr, size);
    if (max-idx ~= size - 1)
      if (max-idx ~= 0) flip(arr, max-idx) end;
      flip(arr, size - 1);
    end if;
    size := size - 1;
  end while;
  arr
end function;

let arr = vector(3, 6, 2, 7, 4, 1, 5);
format-out("%=\n", pancake-sort(arr));
