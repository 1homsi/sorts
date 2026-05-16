define function gnome-sort(arr :: <vector>) => (result :: <vector>)
  let n = size(arr);
  let i = 0;
  while (i < n)
    if (i = 0 | arr[i] >= arr[i - 1])
      i := i + 1
    else
      let tmp = arr[i];
      arr[i] := arr[i - 1];
      arr[i - 1] := tmp;
      i := i - 1
    end if
  end while;
  arr
end function;
